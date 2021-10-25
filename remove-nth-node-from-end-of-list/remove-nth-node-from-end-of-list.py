# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        size = 0
        cur = head
        while cur:
            size += 1
            cur = cur.next
        diff = size - n
        dummy = ListNode(0, head)
        cur = dummy
        for i in range(diff):
            cur = cur.next
        print(cur)
        cur.next = cur.next.next
        return dummy.next