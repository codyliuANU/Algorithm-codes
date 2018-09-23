class Lit {
    int x;
    Lit(int x){
        this.x = x ;
    }

    @Override
    public String toString(){
        String str = "";
        str += this.x;
        return str;
    }
}

