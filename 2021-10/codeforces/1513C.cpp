    #include<bits/stdc++.h>
    using namespace std;
    long long a = 1e9 + 7;
    signed main()
    {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    long long n=200001;
    long long l[n+10];
    for(int i=0;i<=9;i++)
        	{
        		l[i]=1;
        	}
        	for(int i=10;i<=n+9;i++)
        	{
        		l[i] = (l[i-10]+ l[i-9])%a;
        	}
        	int t;
        	cin>>t;
         
        	while(t--)
        	{
        		long long m;
        		long long n;
        		cin>>n>>m;
        		long long r = 0;
        		
        		while(n)
        		{
        			int u=n%10;
        			n=n/10;
    		r += m+u<10?1:l[m+u];
    		r %= a;
    	}
    	cout<<r<<"\n";		
    }
    return 0;
    }
