#include <boost/program_options.hpp>
#include <boost/filesystem.hpp>
#include <boost/algorithm/string.hpp>
#include <boost/progress.hpp>

#include <iostream>
#include <fstream>

#include <SDL.h>

#include "opl3.h"
#include <genmod/breseninter.h>

constexpr int SampleRate = 44100;
std::ifstream imfFile;
std::ofstream rawOut;
int songLength = 0;
int delayCounter = 0;
int imfFreq = 560; // Hz [280|560|700]
bool stopped = false;
std::unique_ptr<boost::progress_display> progress;

void sdlAudioCallback( void* userdata, uint8_t* stream, int len_bytes )
{
    std::fill_n( stream, len_bytes, 0 );
    int16_t* dest = reinterpret_cast<int16_t*>( stream );
    opl::Opl3* chip = reinterpret_cast<opl::Opl3*>( userdata );
    int numSamples = len_bytes / sizeof( int16_t ) / 2;
    ppp::BresenInterpolation interp( SampleRate, opl::Opl3::SampleRate );
    while( numSamples-- > 0 ) {
        if( delayCounter-- <= 0 ) {
            do {
                uint8_t reg, val;
                uint16_t delay;
                ++*progress;
                imfFile.read( reinterpret_cast<char*>( &reg ), 1 ).read( reinterpret_cast<char*>( &val ), 1 ).read( reinterpret_cast<char*>( &delay ), 2 );
                if( !imfFile || imfFile.tellg() >= songLength + 2 ) {
                    stopped = true;
                    return;
                }
                chip->writeReg( reg, val );
                delayCounter = delay * SampleRate / imfFreq;
            }
            while( delayCounter == 0 );
        }

        std::array<int16_t, 4> sample;
        chip->read( &sample );
        *dest = 0;
        dest[0] = ppp::clip( sample[0] + sample[1], -32768, 32767 );
        dest[1] = ppp::clip( sample[2] + sample[3], -32768, 32767 );
        dest += 2;
        if( interp.next() == 2 ) {
            chip->read( nullptr ); // skip a sample
        }
        interp = 0;
    }
    if( rawOut.is_open() )
        rawOut.write( reinterpret_cast<char*>( stream ), len_bytes );
}

int main( int argc, char** argv )
{
    std::string filename, outName;
    boost::program_options::options_description options( "General Options" );
    options.add_options()
    ( "raw,r", boost::program_options::value<std::string>( &outName ), "Save raw sound output into file (44.1kHz interleaved, 16-bit signed)" )
    ( "file,f", boost::program_options::value<std::string>( &filename ), "File to play" )
    ( "speed,s", boost::program_options::value<int>( &imfFreq )->default_value( 560 ), "Playback speed (280, 560, 700 recommended)" )
    ;
    boost::program_options::positional_options_description p;
    p.add( "file", -1 );

    boost::program_options::variables_map vm;
    boost::program_options::store( boost::program_options::command_line_parser( argc, argv ).options( options ).positional( p ).run(), vm );
    boost::program_options::notify( vm );

    if( !boost::filesystem::is_regular_file( filename ) ) {
        std::cout << "Cannot open " << filename << "\n";
        return 1;
    }

    boost::filesystem::path filePath( filename );
    opl::Opl3 emulator;
    if( boost::to_lower_copy( filePath.extension().string() ) != ".imf" ) {
        std::cout << "Not an IMF: " << boost::to_lower_copy( filePath.extension().string() ) << "\n";
        return 1;
    }

    imfFile.open( filename, std::ios::in | std::ios::binary );
    if( !imfFile.is_open() ) {
        std::cout << "Cannot read " << filename << "\n";
        return 1;
    }
    imfFile.read( reinterpret_cast<char*>( &songLength ), 2 );
    if( songLength == 0 ) {
        imfFile.seekg( 0, std::ios::end );
        songLength = imfFile.tellg();
        songLength -= 2;
        imfFile.seekg( 0 );
    }
    imfFile.clear();

    if( !outName.empty() )
        rawOut.open( outName, std::ios::out | std::ios::trunc | std::ios::binary );

    opl::Opl3 chip;

    SDL_AudioSpec obtainedAudio;
    if( !rawOut.is_open() ) {
        if( SDL_Init( SDL_INIT_AUDIO ) ) {
            std::cout << "Cannot init SDL: " << SDL_GetError() << "\n";
            return 1;
        }
        SDL_AudioSpec desiredAudio;
        desiredAudio.freq = SampleRate;
        desiredAudio.channels = 2;
        desiredAudio.format = AUDIO_S16LSB;
        desiredAudio.samples = 2048;
        desiredAudio.callback = sdlAudioCallback;
        desiredAudio.userdata = &chip;
        if( SDL_OpenAudio( &desiredAudio, &obtainedAudio ) < 0 ) {
            std::cout << "Couldn't open audio: " << SDL_GetError() << "\n";
            return 1;
        }
        progress.reset( new boost::progress_display( songLength / 4 ) );
        SDL_PauseAudio( 0 );
        while( !stopped ) {
            SDL_Delay( 10 );
        }
    }
    else {
        progress.reset( new boost::progress_display( songLength / 4 ) );
        ppp::BresenInterpolation interp( SampleRate, opl::Opl3::SampleRate );
        while( !stopped ) {
            if( delayCounter-- <= 0 ) {
                do {
                    uint8_t reg, val;
                    uint16_t delay;
                    ++*progress;
                    imfFile.read( reinterpret_cast<char*>( &reg ), 1 ).read( reinterpret_cast<char*>( &val ), 1 ).read( reinterpret_cast<char*>( &delay ), 2 );
                    if( !imfFile || imfFile.tellg() >= songLength + 2 ) {
                        stopped = true;
                        break;
                    }
                    chip.writeReg( reg, val );
                    delayCounter = delay * SampleRate / imfFreq;
                }
                while( delayCounter == 0 );
            }

            std::array<int16_t, 4> sample;
            chip.read( &sample );
            int16_t out[2] = {
                int16_t( ppp::clip( sample[0] + sample[1], -32768, 32767 ) ),
                int16_t( ppp::clip( sample[2] + sample[3], -32768, 32767 ) )
            };
            if( interp.next() == 2 ) {
                chip.read( nullptr ); // skip a sample
            }
            interp = 0;
            rawOut.write( reinterpret_cast<char*>( out ), 2 * sizeof( int16_t ) );
        }
    }

    std::cout << "End of music.\n";
    return 0;
}
