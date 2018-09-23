class Node{
    int v;
    Node next;
    Node(int v, Node next){
        this.v = v;
        this.next = next;
    }

    public static void main(String[] args) {
        Node n = new Node(3,new Node(2,null));
    }
}

// data List a = Node a (List a)