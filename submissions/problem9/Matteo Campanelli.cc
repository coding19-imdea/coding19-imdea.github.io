#include <iostream>
#include <vector>
#include <sstream>
#include <string>
using namespace std;

template<typename T>
void print_vec(const vector<T> &v)
{
    for (auto x : v) {
        cout << x << " ";
    }
    cout << endl;
}
void make_flip(vector<unsigned> &v, size_t flip_pos)
{
    //cout << endl;
    //print_vec(v);
    vector<unsigned> tmp;
    for (int i = flip_pos; i >= 0; i--) {
        //cout << i << " is "  << v[i] << endl;
        tmp.push_back(v[i]);
    }
    tmp.insert(end(tmp), begin(v)+flip_pos+1, end(v));
    v = tmp;
    //print_vec(v);
    //cout << endl;

}

// top is 0, bottom is v.size()-1
void solve(size_t cur_max, vector<unsigned> &v, vector<unsigned>  &sol)
{
    //cout << "cur_max = " << cur_max << endl;
    if (cur_max == 0) 
        return;

    auto N = v.size();
    // find max
    size_t i;
    for (i = 0; i < cur_max; i++) {
        if (v[i] == cur_max) {
            break;
        }
    }

    // if already in place do nothing
    if (i+1 == cur_max) {
        // do nothing
    } else {
        // if not at the top
        if (i != 0) {
            sol.push_back(N-i);
            make_flip(v, i);
        }
        sol.push_back(N-cur_max+1);
        make_flip(v, cur_max-1);
    }
    solve(cur_max-1, v, sol);


}

vector<unsigned> split(const string &s, char delimiter) {     
    vector<unsigned> tokens;     
    string token;     
    istringstream tokenStream(s);     
    while (getline(tokenStream, token, delimiter)) {      
        tokens.push_back(stoi(token));     
    }     
    return tokens;  
}

int main(int argc, char **argv)
{
    string str;
    unsigned cnt = 0;
    while (getline(cin, str)) {
        vector<unsigned> v = split(str, ' '); //  = {5, 1, 2, 3, 4};
        vector<unsigned> orig_v(v);

        if (v.size() == 0) {
            continue;
        } else if (v.size() == 1) {
            cnt += v[0];
            cout << v[0] << endl << "0\n";
            continue;
        }
        //make_flip(v, ),
        //return 0;
        vector<unsigned> sol;
        //cout << "size " << v.size() << endl;
        solve(v.size(), v, sol);
        
        // print_vec(v);
        for (auto i = 0; i < orig_v.size(); i++) {
            cnt += orig_v[i];
            cout << orig_v[i] << (i == orig_v.size()-1 ? "\n" : " ");
        }

        for (auto x : sol) {
            cnt += x;
            cout << x << " ";
        }  
        cout << "0\n";
        //cout << endl;
    }
    cout << cnt << endl;
    return 0;
}