//
// Created by liubo on 2018/11/20.
//

#include "mine.h"


#include <cstdlib>

std::string mine::get()
{
    std::string ret;
    auto cnt = std::rand() % 10;
    char chars[] = {'a','b'};
    auto char_cnt = sizeof(chars) / sizeof('a');
    for(auto i=0; i<cnt; i++)
    {
        ret += chars[std::rand() % char_cnt];
    }
    return ret;
}