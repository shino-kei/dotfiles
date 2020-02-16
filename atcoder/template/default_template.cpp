#include <bits/stdc++.h>
using namespace std;
 // clang-format off

using LL = long long;
#define COUT(x) cout << #x << " = " << (x) << " (L" << __LINE__ << ")" << endl

#define REP(i,x) for(int i=0;i<(int)(x);i++)
#define FOR(i,c) for(__typeof((c).begin())i=(c).begin();i!=(c).end();i++)
#define RFOR(i,c) for(__typeof((c).rbegin())i=(c).rbegin();i!=(c).rend();i++)
#define UNIQUE(v) v.erase( unique(v.begin(), v.end()), v.end() );
 
template<class T> ostream& operator<<(ostream &os, const vector<T> &t) {
os<<"["; FOR(it,t) {if(it!=t.begin()) os<<","; os<<*it;} os<<"]"; return os;
}
template<class T> ostream& operator<<(ostream &os, const set<T> &t) {
os<<"{"; FOR(it,t) {if(it!=t.begin()) os<<","; os<<*it;} os<<"}"; return os;
}
template<class S, class T> ostream& operator<<(ostream &os, const pair<S,T> &t) { return os<<"("<<t.first<<","<<t.second<<")";}
// clang-format on
{% if mod %}
const long long MOD = {{ mod }};
{% endif %}
{% if yes_str %}
const string YES = "{{ yes_str }}";
{% endif %}
{% if no_str %}
const string NO = "{{ no_str }}";
{% endif %}

{% if prediction_success %}
void solve({{ formal_arguments }}){
  // solver code

}
{% endif %}

int main(){
    {% if prediction_success %}
    {{input_part}}
    solve({{ actual_arguments }});
    {% else %}
    // Failed to predict input format
    {% endif %}
    return 0;
}
