#include <stdio.h>
#include <stdlib.h>

int *merge_sort(int *a, unsigned int l);
int *merge(int *l, unsigned int ll, int *r, unsigned int rl);


int main(int argc, char **argv) {
	int a[] = {5,4,3,2,1,0};
	unsigned int len = sizeof(a)/sizeof(a[0]);

	int *s = merge_sort(a, len);
	char* d = "";
	for (unsigned int i = 0; i<len; i++) {
		printf("%s%d", d, s[i]);
		d = ", ";
	}
	printf("\n");
	return 0;
}

int *merge_sort(int *a, unsigned int l) {
	if (l == 1) {
		int *m = malloc(sizeof(a[0]));
		m[0] = a[0];
		return m;
	}

	int *sorted_l = merge_sort(a, l/2);
	int *sorted_r = merge_sort(a+l/2, l - l/2);

	int *merged = merge(sorted_l, l/2, sorted_r, l - l/2);
	free(sorted_l);
	free(sorted_r);
	return merged;
}

int *merge(int *l, unsigned int ll, int *r, unsigned int rl) {

	unsigned int ml = ll + rl, li = 0, ri = 0;
	
	int *m = (int *)malloc(ml * sizeof(l[0]));
	for (unsigned int i = 0; i < ml; i++) {
		if (li < ll && ri < rl) {
			if (l[li] <= r[ri]) {
				m[i] = l[li];
				li++;
			}
			else {
				m[i] = r[ri];
				ri++;
			}
		}
		else if (li < ll) {
				m[i] = l[li];
				li++;
		}
		else {
				m[i] = r[ri];
				ri++;
		}
	}
	return m;
}








