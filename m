Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 965C7369424
	for <lists+linux-cachefs@lfdr.de>; Fri, 23 Apr 2021 15:56:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-I1UVKeopPtam0o5HharYRA-1; Fri, 23 Apr 2021 09:56:01 -0400
X-MC-Unique: I1UVKeopPtam0o5HharYRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCED21020C22;
	Fri, 23 Apr 2021 13:55:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F3741B5AB;
	Fri, 23 Apr 2021 13:55:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4140644A5B;
	Fri, 23 Apr 2021 13:55:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13MDZqaL026879 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 09:35:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C25421D528B; Thu, 22 Apr 2021 13:35:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A1D21D5286
	for <linux-cachefs@redhat.com>; Thu, 22 Apr 2021 13:35:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66718104D9B1
	for <linux-cachefs@redhat.com>; Thu, 22 Apr 2021 13:35:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-226-FXDSl0VROYa36Ex_NIUvdA-1;
	Thu, 22 Apr 2021 09:35:40 -0400
X-MC-Unique: FXDSl0VROYa36Ex_NIUvdA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE02C61452;
	Thu, 22 Apr 2021 13:35:37 +0000 (UTC)
Message-ID: <27c369a8f42bb8a617672b2dc0126a5c6df5a050.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org
Date: Thu, 22 Apr 2021 09:35:36 -0400
In-Reply-To: <161789064740.6155.11932541175173658065.stgit@warthog.procyon.org.uk>
References: <161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789064740.6155.11932541175173658065.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 23 Apr 2021 09:55:53 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	linux-kernel@vger.kernel.org, Martinet <asmadeus@codewreck.org>,
	Trond, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Christoph Hellwig <hch@lst.de>, Steve French <sfrench@samba.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v6 01/30] iov_iter: Add ITER_XARRAY
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-08 at 15:04 +0100, David Howells wrote:
> Add an iterator, ITER_XARRAY, that walks through a set of pages attached to
> an xarray, starting at a given page and offset and walking for the
> specified amount of bytes.  The iterator supports transparent huge pages.
> 
> The iterate_xarray() macro calls the helper function with rcu_access()
> helped.  I think that this is only a problem for iov_iter_for_each_range()
> - and that returns an error for ITER_XARRAY (also, this function does not
> appear to be called).
> 
> The caller must guarantee that the pages are all present and they must be
> locked using PG_locked, PG_writeback or PG_fscache to prevent them from
> going away or being migrated whilst they're being accessed.
> 
> This is useful for copying data from socket buffers to inodes in network
> filesystems and for transferring data between those inodes and the cache
> using direct I/O.
> 
> Whilst it is true that ITER_BVEC could be used instead, that would require
> a bio_vec array to be allocated to refer to all the pages - which should be
> redundant if inode->i_pages also points to all these pages.
> 
> Note that older versions of this patch implemented an ITER_MAPPING instead,
> which was almost the same.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Alexander Viro <viro@zeniv.linux.org.uk>
> cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> cc: Christoph Hellwig <hch@lst.de>
> cc: linux-mm@kvack.org
> cc: linux-cachefs@redhat.com
> cc: linux-afs@lists.infradead.org
> cc: linux-nfs@vger.kernel.org
> cc: linux-cifs@vger.kernel.org
> cc: ceph-devel@vger.kernel.org
> cc: v9fs-developer@lists.sourceforge.net
> cc: linux-fsdevel@vger.kernel.org
> Link: https://lore.kernel.org/r/3577430.1579705075@warthog.procyon.org.uk/ # rfc
> Link: https://lore.kernel.org/r/158861205740.340223.16592990225607814022.stgit@warthog.procyon.org.uk/ # rfc
> Link: https://lore.kernel.org/r/159465785214.1376674.6062549291411362531.stgit@warthog.procyon.org.uk/
> Link: https://lore.kernel.org/r/160588477334.3465195.3608963255682568730.stgit@warthog.procyon.org.uk/ # rfc
> Link: https://lore.kernel.org/r/161118129703.1232039.17141248432017826976.stgit@warthog.procyon.org.uk/ # rfc
> Link: https://lore.kernel.org/r/161161026313.2537118.14676007075365418649.stgit@warthog.procyon.org.uk/ # v2
> Link: https://lore.kernel.org/r/161340386671.1303470.10752208972482479840.stgit@warthog.procyon.org.uk/ # v3
> Link: https://lore.kernel.org/r/161539527815.286939.14607323792547049341.stgit@warthog.procyon.org.uk/ # v4
> Link: https://lore.kernel.org/r/161653786033.2770958.14154191921867463240.stgit@warthog.procyon.org.uk/ # v5
> ---
> 
>  include/linux/uio.h |   11 ++
>  lib/iov_iter.c      |  313 +++++++++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 301 insertions(+), 23 deletions(-)
> 
> diff --git a/include/linux/uio.h b/include/linux/uio.h
> index 27ff8eb786dc..5f5ffc45d4aa 100644
> --- a/include/linux/uio.h
> +++ b/include/linux/uio.h
> @@ -10,6 +10,7 @@
>  #include <uapi/linux/uio.h>
>  
>  struct page;
> +struct address_space;
>  struct pipe_inode_info;
>  
>  struct kvec {
> @@ -24,6 +25,7 @@ enum iter_type {
>  	ITER_BVEC = 16,
>  	ITER_PIPE = 32,
>  	ITER_DISCARD = 64,
> +	ITER_XARRAY = 128,
>  };
>  
>  struct iov_iter {
> @@ -39,6 +41,7 @@ struct iov_iter {
>  		const struct iovec *iov;
>  		const struct kvec *kvec;
>  		const struct bio_vec *bvec;
> +		struct xarray *xarray;
>  		struct pipe_inode_info *pipe;
>  	};
>  	union {
> @@ -47,6 +50,7 @@ struct iov_iter {
>  			unsigned int head;
>  			unsigned int start_head;
>  		};
> +		loff_t xarray_start;
>  	};
>  };
>  
> @@ -80,6 +84,11 @@ static inline bool iov_iter_is_discard(const struct iov_iter *i)
>  	return iov_iter_type(i) == ITER_DISCARD;
>  }
>  
> +static inline bool iov_iter_is_xarray(const struct iov_iter *i)
> +{
> +	return iov_iter_type(i) == ITER_XARRAY;
> +}
> +
>  static inline unsigned char iov_iter_rw(const struct iov_iter *i)
>  {
>  	return i->type & (READ | WRITE);
> @@ -221,6 +230,8 @@ void iov_iter_bvec(struct iov_iter *i, unsigned int direction, const struct bio_
>  void iov_iter_pipe(struct iov_iter *i, unsigned int direction, struct pipe_inode_info *pipe,
>  			size_t count);
>  void iov_iter_discard(struct iov_iter *i, unsigned int direction, size_t count);
> +void iov_iter_xarray(struct iov_iter *i, unsigned int direction, struct xarray *xarray,
> +		     loff_t start, size_t count);
>  ssize_t iov_iter_get_pages(struct iov_iter *i, struct page **pages,
>  			size_t maxsize, unsigned maxpages, size_t *start);
>  ssize_t iov_iter_get_pages_alloc(struct iov_iter *i, struct page ***pages,
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index f66c62aa7154..f808c625c11e 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -76,7 +76,44 @@
>  	}						\
>  }
>  

As a general note, iov_iter.c could really do with some (verbose)
comments explaining things. A kerneldoc header that explains the
arguments to iterate_all_kinds would sure make this easier to review.

> -#define iterate_all_kinds(i, n, v, I, B, K) {			\
> +#define iterate_xarray(i, n, __v, skip, STEP) {		\
> +	struct page *head = NULL;				\
> +	size_t wanted = n, seg, offset;				\
> +	loff_t start = i->xarray_start + skip;			\
> +	pgoff_t index = start >> PAGE_SHIFT;			\
> +	int j;							\
> +								\
> +	XA_STATE(xas, i->xarray, index);			\
> +								\
> +	rcu_read_lock();						\
> +	xas_for_each(&xas, head, ULONG_MAX) {				\
> +		if (xas_retry(&xas, head))				\
> +			continue;					\
> +		if (WARN_ON(xa_is_value(head)))				\
> +			break;						\
> +		if (WARN_ON(PageHuge(head)))				\
> +			break;						\
> +		for (j = (head->index < index) ? index - head->index : 0; \
> +		     j < thp_nr_pages(head); j++) {			\
> +			__v.bv_page = head + j;				\
> +			offset = (i->xarray_start + skip) & ~PAGE_MASK;	\
> +			seg = PAGE_SIZE - offset;			\
> +			__v.bv_offset = offset;				\
> +			__v.bv_len = min(n, seg);			\
> +			(void)(STEP);					\
> +			n -= __v.bv_len;				\
> +			skip += __v.bv_len;				\
> +			if (n == 0)					\
> +				break;					\
> +		}							\
> +		if (n == 0)						\
> +			break;						\
> +	}							\
> +	rcu_read_unlock();					\
> +	n = wanted - n;						\
> +}
> +
> +#define iterate_all_kinds(i, n, v, I, B, K, X) {		\
>  	if (likely(n)) {					\
>  		size_t skip = i->iov_offset;			\
>  		if (unlikely(i->type & ITER_BVEC)) {		\
> @@ -88,6 +125,9 @@
>  			struct kvec v;				\
>  			iterate_kvec(i, n, v, kvec, skip, (K))	\
>  		} else if (unlikely(i->type & ITER_DISCARD)) {	\
> +		} else if (unlikely(i->type & ITER_XARRAY)) {	\
> +			struct bio_vec v;			\
> +			iterate_xarray(i, n, v, skip, (X));	\
>  		} else {					\
>  			const struct iovec *iov;		\
>  			struct iovec v;				\
> @@ -96,7 +136,7 @@
>  	}							\
>  }
>  
> -#define iterate_and_advance(i, n, v, I, B, K) {			\
> +#define iterate_and_advance(i, n, v, I, B, K, X) {		\
>  	if (unlikely(i->count < n))				\
>  		n = i->count;					\
>  	if (i->count) {						\
> @@ -121,6 +161,9 @@
>  			i->kvec = kvec;				\
>  		} else if (unlikely(i->type & ITER_DISCARD)) {	\
>  			skip += n;				\
> +		} else if (unlikely(i->type & ITER_XARRAY)) {	\
> +			struct bio_vec v;			\
> +			iterate_xarray(i, n, v, skip, (X))	\
>  		} else {					\
>  			const struct iovec *iov;		\
>  			struct iovec v;				\
> @@ -622,7 +665,9 @@ size_t _copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
>  		copyout(v.iov_base, (from += v.iov_len) - v.iov_len, v.iov_len),
>  		memcpy_to_page(v.bv_page, v.bv_offset,
>  			       (from += v.bv_len) - v.bv_len, v.bv_len),
> -		memcpy(v.iov_base, (from += v.iov_len) - v.iov_len, v.iov_len)
> +		memcpy(v.iov_base, (from += v.iov_len) - v.iov_len, v.iov_len),
> +		memcpy_to_page(v.bv_page, v.bv_offset,
> +			       (from += v.bv_len) - v.bv_len, v.bv_len)
>  	)
>  
>  	return bytes;
> @@ -738,6 +783,16 @@ size_t _copy_mc_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
>  			bytes = curr_addr - s_addr - rem;
>  			return bytes;
>  		}
> +		}),
> +		({
> +		rem = copy_mc_to_page(v.bv_page, v.bv_offset,
> +				      (from += v.bv_len) - v.bv_len, v.bv_len);
> +		if (rem) {
> +			curr_addr = (unsigned long) from;
> +			bytes = curr_addr - s_addr - rem;
> +			rcu_read_unlock();
> +			return bytes;
> +		}
>  		})
>  	)
>  
> @@ -759,7 +814,9 @@ size_t _copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
>  		copyin((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
>  		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
>  				 v.bv_offset, v.bv_len),
> -		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len)
> +		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
> +		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
> +				 v.bv_offset, v.bv_len)
>  	)
>  
>  	return bytes;
> @@ -785,7 +842,9 @@ bool _copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
>  		0;}),
>  		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
>  				 v.bv_offset, v.bv_len),
> -		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len)
> +		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
> +		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
> +				 v.bv_offset, v.bv_len)
>  	)
>  
>  	iov_iter_advance(i, bytes);
> @@ -805,7 +864,9 @@ size_t _copy_from_iter_nocache(void *addr, size_t bytes, struct iov_iter *i)
>  					 v.iov_base, v.iov_len),
>  		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
>  				 v.bv_offset, v.bv_len),
> -		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len)
> +		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
> +		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
> +				 v.bv_offset, v.bv_len)
>  	)
>  
>  	return bytes;
> @@ -840,7 +901,9 @@ size_t _copy_from_iter_flushcache(void *addr, size_t bytes, struct iov_iter *i)
>  		memcpy_page_flushcache((to += v.bv_len) - v.bv_len, v.bv_page,
>  				 v.bv_offset, v.bv_len),
>  		memcpy_flushcache((to += v.iov_len) - v.iov_len, v.iov_base,
> -			v.iov_len)
> +			v.iov_len),
> +		memcpy_page_flushcache((to += v.bv_len) - v.bv_len, v.bv_page,
> +				 v.bv_offset, v.bv_len)
>  	)
>  
>  	return bytes;
> @@ -864,7 +927,9 @@ bool _copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i)
>  		0;}),
>  		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
>  				 v.bv_offset, v.bv_len),
> -		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len)
> +		memcpy((to += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
> +		memcpy_from_page((to += v.bv_len) - v.bv_len, v.bv_page,
> +				 v.bv_offset, v.bv_len)
>  	)
>  
>  	iov_iter_advance(i, bytes);
> @@ -901,7 +966,7 @@ size_t copy_page_to_iter(struct page *page, size_t offset, size_t bytes,
>  {
>  	if (unlikely(!page_copy_sane(page, offset, bytes)))
>  		return 0;
> -	if (i->type & (ITER_BVEC|ITER_KVEC)) {
> +	if (i->type & (ITER_BVEC | ITER_KVEC | ITER_XARRAY)) {
>  		void *kaddr = kmap_atomic(page);
>  		size_t wanted = copy_to_iter(kaddr + offset, bytes, i);
>  		kunmap_atomic(kaddr);
> @@ -924,7 +989,7 @@ size_t copy_page_from_iter(struct page *page, size_t offset, size_t bytes,
>  		WARN_ON(1);
>  		return 0;
>  	}
> -	if (i->type & (ITER_BVEC|ITER_KVEC)) {
> +	if (i->type & (ITER_BVEC | ITER_KVEC | ITER_XARRAY)) {
>  		void *kaddr = kmap_atomic(page);
>  		size_t wanted = _copy_from_iter(kaddr + offset, bytes, i);
>  		kunmap_atomic(kaddr);
> @@ -968,7 +1033,8 @@ size_t iov_iter_zero(size_t bytes, struct iov_iter *i)
>  	iterate_and_advance(i, bytes, v,
>  		clear_user(v.iov_base, v.iov_len),
>  		memzero_page(v.bv_page, v.bv_offset, v.bv_len),
> -		memset(v.iov_base, 0, v.iov_len)
> +		memset(v.iov_base, 0, v.iov_len),
> +		memzero_page(v.bv_page, v.bv_offset, v.bv_len)
>  	)
>  
>  	return bytes;
> @@ -992,7 +1058,9 @@ size_t iov_iter_copy_from_user_atomic(struct page *page,
>  		copyin((p += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
>  		memcpy_from_page((p += v.bv_len) - v.bv_len, v.bv_page,
>  				 v.bv_offset, v.bv_len),
> -		memcpy((p += v.iov_len) - v.iov_len, v.iov_base, v.iov_len)
> +		memcpy((p += v.iov_len) - v.iov_len, v.iov_base, v.iov_len),
> +		memcpy_from_page((p += v.bv_len) - v.bv_len, v.bv_page,
> +				 v.bv_offset, v.bv_len)
>  	)
>  	kunmap_atomic(kaddr);
>  	return bytes;
> @@ -1078,11 +1146,16 @@ void iov_iter_advance(struct iov_iter *i, size_t size)
>  		i->count -= size;
>  		return;
>  	}
> +	if (unlikely(iov_iter_is_xarray(i))) {
> +		i->iov_offset += size;
> +		i->count -= size;
> +		return;
> +	}
>  	if (iov_iter_is_bvec(i)) {
>  		iov_iter_bvec_advance(i, size);
>  		return;
>  	}
> -	iterate_and_advance(i, size, v, 0, 0, 0)
> +	iterate_and_advance(i, size, v, 0, 0, 0, 0)
>  }
>  EXPORT_SYMBOL(iov_iter_advance);
>  
> @@ -1126,7 +1199,12 @@ void iov_iter_revert(struct iov_iter *i, size_t unroll)
>  		return;
>  	}
>  	unroll -= i->iov_offset;
> -	if (iov_iter_is_bvec(i)) {
> +	if (iov_iter_is_xarray(i)) {
> +		BUG(); /* We should never go beyond the start of the specified
> +			* range since we might then be straying into pages that
> +			* aren't pinned.
> +			*/

It's not needed now, but there are a lot of calls to iov_iter_revert in
the kernel, and going backward doesn't necessarily mean we'd be straying
into an unpinned range. xarray_start never changes; would it not be ok
to allow reverting as long as you don't move to a lower offset than that
point?


> +	} else if (iov_iter_is_bvec(i)) {
>  		const struct bio_vec *bvec = i->bvec;
>  		while (1) {
>  			size_t n = (--bvec)->bv_len;
> @@ -1163,9 +1241,9 @@ size_t iov_iter_single_seg_count(const struct iov_iter *i)
>  		return i->count;	// it is a silly place, anyway
>  	if (i->nr_segs == 1)
>  		return i->count;
> -	if (unlikely(iov_iter_is_discard(i)))
> +	if (unlikely(iov_iter_is_discard(i) || iov_iter_is_xarray(i)))
>  		return i->count;
> -	else if (iov_iter_is_bvec(i))
> +	if (iov_iter_is_bvec(i))
>  		return min(i->count, i->bvec->bv_len - i->iov_offset);
>  	else
>  		return min(i->count, i->iov->iov_len - i->iov_offset);
> @@ -1213,6 +1291,31 @@ void iov_iter_pipe(struct iov_iter *i, unsigned int direction,
>  }
>  EXPORT_SYMBOL(iov_iter_pipe);
>  
> +/**
> + * iov_iter_xarray - Initialise an I/O iterator to use the pages in an xarray
> + * @i: The iterator to initialise.
> + * @direction: The direction of the transfer.
> + * @xarray: The xarray to access.
> + * @start: The start file position.
> + * @count: The size of the I/O buffer in bytes.
> + *
> + * Set up an I/O iterator to either draw data out of the pages attached to an
> + * inode or to inject data into those pages.  The pages *must* be prevented
> + * from evaporation, either by taking a ref on them or locking them by the
> + * caller.
> + */
> +void iov_iter_xarray(struct iov_iter *i, unsigned int direction,
> +		     struct xarray *xarray, loff_t start, size_t count)
> +{
> +	BUG_ON(direction & ~1);
> +	i->type = ITER_XARRAY | (direction & (READ | WRITE));
> +	i->xarray = xarray;
> +	i->xarray_start = start;
> +	i->count = count;
> +	i->iov_offset = 0;
> +}
> +EXPORT_SYMBOL(iov_iter_xarray);
> +
>  /**
>   * iov_iter_discard - Initialise an I/O iterator that discards data
>   * @i: The iterator to initialise.
> @@ -1246,7 +1349,8 @@ unsigned long iov_iter_alignment(const struct iov_iter *i)
>  	iterate_all_kinds(i, size, v,
>  		(res |= (unsigned long)v.iov_base | v.iov_len, 0),
>  		res |= v.bv_offset | v.bv_len,
> -		res |= (unsigned long)v.iov_base | v.iov_len
> +		res |= (unsigned long)v.iov_base | v.iov_len,
> +		res |= v.bv_offset | v.bv_len
>  	)
>  	return res;
>  }
> @@ -1268,7 +1372,9 @@ unsigned long iov_iter_gap_alignment(const struct iov_iter *i)
>  		(res |= (!res ? 0 : (unsigned long)v.bv_offset) |
>  			(size != v.bv_len ? size : 0)),
>  		(res |= (!res ? 0 : (unsigned long)v.iov_base) |
> -			(size != v.iov_len ? size : 0))
> +			(size != v.iov_len ? size : 0)),
> +		(res |= (!res ? 0 : (unsigned long)v.bv_offset) |
> +			(size != v.bv_len ? size : 0))
>  		);
>  	return res;
>  }
> @@ -1318,6 +1424,75 @@ static ssize_t pipe_get_pages(struct iov_iter *i,
>  	return __pipe_get_pages(i, min(maxsize, capacity), pages, iter_head, start);
>  }
>  
> +static ssize_t iter_xarray_copy_pages(struct page **pages, struct xarray *xa,
> +				       pgoff_t index, unsigned int nr_pages)

nit: This could use a different name -- I was expecting to see page
_contents_ copied here, but it's just populating the page array with
pointers.

> +{
> +	XA_STATE(xas, xa, index);
> +	struct page *page;
> +	unsigned int ret = 0;
> +
> +	rcu_read_lock();
> +	for (page = xas_load(&xas); page; page = xas_next(&xas)) {
> +		if (xas_retry(&xas, page))
> +			continue;
> +
> +		/* Has the page moved or been split? */
> +		if (unlikely(page != xas_reload(&xas))) {
> +			xas_reset(&xas);
> +			continue;
> +		}
> +
> +		pages[ret] = find_subpage(page, xas.xa_index);
> +		get_page(pages[ret]);
> +		if (++ret == nr_pages)
> +			break;
> +	}
> +	rcu_read_unlock();
> +	return ret;
> +}
> +
> +static ssize_t iter_xarray_get_pages(struct iov_iter *i,
> +				     struct page **pages, size_t maxsize,
> +				     unsigned maxpages, size_t *_start_offset)
> +{
> +	unsigned nr, offset;
> +	pgoff_t index, count;
> +	size_t size = maxsize, actual;
> +	loff_t pos;
> +
> +	if (!size || !maxpages)
> +		return 0;
> +
> +	pos = i->xarray_start + i->iov_offset;
> +	index = pos >> PAGE_SHIFT;
> +	offset = pos & ~PAGE_MASK;
> +	*_start_offset = offset;
> +
> +	count = 1;
> +	if (size > PAGE_SIZE - offset) {
> +		size -= PAGE_SIZE - offset;
> +		count += size >> PAGE_SHIFT;
> +		size &= ~PAGE_MASK;
> +		if (size)
> +			count++;
> +	}
> +
> +	if (count > maxpages)
> +		count = maxpages;
> +
> +	nr = iter_xarray_copy_pages(pages, i->xarray, index, count);
> +	if (nr == 0)
> +		return 0;
> +
> +	actual = PAGE_SIZE * nr;
> +	actual -= offset;
> +	if (nr == count && size > 0) {
> +		unsigned last_offset = (nr > 1) ? 0 : offset;
> +		actual -= PAGE_SIZE - (last_offset + size);
> +	}
> +	return actual;
> +}
> +
>  ssize_t iov_iter_get_pages(struct iov_iter *i,
>  		   struct page **pages, size_t maxsize, unsigned maxpages,
>  		   size_t *start)
> @@ -1327,6 +1502,8 @@ ssize_t iov_iter_get_pages(struct iov_iter *i,
>  
>  	if (unlikely(iov_iter_is_pipe(i)))
>  		return pipe_get_pages(i, pages, maxsize, maxpages, start);
> +	if (unlikely(iov_iter_is_xarray(i)))
> +		return iter_xarray_get_pages(i, pages, maxsize, maxpages, start);
>  	if (unlikely(iov_iter_is_discard(i)))
>  		return -EFAULT;
>  
> @@ -1353,7 +1530,8 @@ ssize_t iov_iter_get_pages(struct iov_iter *i,
>  		return v.bv_len;
>  	}),({
>  		return -EFAULT;
> -	})
> +	}),
> +	0
>  	)
>  	return 0;
>  }
> @@ -1397,6 +1575,51 @@ static ssize_t pipe_get_pages_alloc(struct iov_iter *i,
>  	return n;
>  }
>  
> +static ssize_t iter_xarray_get_pages_alloc(struct iov_iter *i,
> +					   struct page ***pages, size_t maxsize,
> +					   size_t *_start_offset)
> +{
> +	struct page **p;
> +	unsigned nr, offset;
> +	pgoff_t index, count;
> +	size_t size = maxsize, actual;
> +	loff_t pos;
> +
> +	if (!size)
> +		return 0;
> +
> +	pos = i->xarray_start + i->iov_offset;
> +	index = pos >> PAGE_SHIFT;
> +	offset = pos & ~PAGE_MASK;
> +	*_start_offset = offset;
> +
> +	count = 1;
> +	if (size > PAGE_SIZE - offset) {
> +		size -= PAGE_SIZE - offset;
> +		count += size >> PAGE_SHIFT;
> +		size &= ~PAGE_MASK;
> +		if (size)
> +			count++;
> +	}
> +
> +	p = get_pages_array(count);
> +	if (!p)
> +		return -ENOMEM;
> +	*pages = p;
> +
> +	nr = iter_xarray_copy_pages(p, i->xarray, index, count);
> +	if (nr == 0)
> +		return 0;
> +
> +	actual = PAGE_SIZE * nr;
> +	actual -= offset;
> +	if (nr == count && size > 0) {
> +		unsigned last_offset = (nr > 1) ? 0 : offset;
> +		actual -= PAGE_SIZE - (last_offset + size);
> +	}
> +	return actual;
> +}
> +
>  ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
>  		   struct page ***pages, size_t maxsize,
>  		   size_t *start)
> @@ -1408,6 +1631,8 @@ ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
>  
>  	if (unlikely(iov_iter_is_pipe(i)))
>  		return pipe_get_pages_alloc(i, pages, maxsize, start);
> +	if (unlikely(iov_iter_is_xarray(i)))
> +		return iter_xarray_get_pages_alloc(i, pages, maxsize, start);
>  	if (unlikely(iov_iter_is_discard(i)))
>  		return -EFAULT;
>  
> @@ -1440,7 +1665,7 @@ ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,
>  		return v.bv_len;
>  	}),({
>  		return -EFAULT;
> -	})
> +	}), 0
>  	)
>  	return 0;
>  }
> @@ -1478,6 +1703,13 @@ size_t csum_and_copy_from_iter(void *addr, size_t bytes, __wsum *csum,
>  				      v.iov_base, v.iov_len,
>  				      sum, off);
>  		off += v.iov_len;
> +	}), ({
> +		char *p = kmap_atomic(v.bv_page);
> +		sum = csum_and_memcpy((to += v.bv_len) - v.bv_len,
> +				      p + v.bv_offset, v.bv_len,
> +				      sum, off);
> +		kunmap_atomic(p);
> +		off += v.bv_len;
>  	})
>  	)
>  	*csum = sum;
> @@ -1519,6 +1751,13 @@ bool csum_and_copy_from_iter_full(void *addr, size_t bytes, __wsum *csum,
>  				      v.iov_base, v.iov_len,
>  				      sum, off);
>  		off += v.iov_len;
> +	}), ({
> +		char *p = kmap_atomic(v.bv_page);
> +		sum = csum_and_memcpy((to += v.bv_len) - v.bv_len,
> +				      p + v.bv_offset, v.bv_len,
> +				      sum, off);
> +		kunmap_atomic(p);
> +		off += v.bv_len;
>  	})
>  	)
>  	*csum = sum;
> @@ -1565,6 +1804,13 @@ size_t csum_and_copy_to_iter(const void *addr, size_t bytes, void *_csstate,
>  				     (from += v.iov_len) - v.iov_len,
>  				     v.iov_len, sum, off);
>  		off += v.iov_len;
> +	}), ({
> +		char *p = kmap_atomic(v.bv_page);
> +		sum = csum_and_memcpy(p + v.bv_offset,
> +				      (from += v.bv_len) - v.bv_len,
> +				      v.bv_len, sum, off);
> +		kunmap_atomic(p);
> +		off += v.bv_len;
>  	})
>  	)
>  	csstate->csum = sum;
> @@ -1615,6 +1861,21 @@ int iov_iter_npages(const struct iov_iter *i, int maxpages)
>  		npages = pipe_space_for_user(iter_head, pipe->tail, pipe);
>  		if (npages >= maxpages)
>  			return maxpages;
> +	} else if (unlikely(iov_iter_is_xarray(i))) {
> +		unsigned offset;
> +
> +		offset = (i->xarray_start + i->iov_offset) & ~PAGE_MASK;
> +
> +		npages = 1;
> +		if (size > PAGE_SIZE - offset) {
> +			size -= PAGE_SIZE - offset;
> +			npages += size >> PAGE_SHIFT;
> +			size &= ~PAGE_MASK;
> +			if (size)
> +				npages++;
> +		}
> +		if (npages >= maxpages)
> +			return maxpages;
>  	} else iterate_all_kinds(i, size, v, ({
>  		unsigned long p = (unsigned long)v.iov_base;
>  		npages += DIV_ROUND_UP(p + v.iov_len, PAGE_SIZE)
> @@ -1631,7 +1892,8 @@ int iov_iter_npages(const struct iov_iter *i, int maxpages)
>  			- p / PAGE_SIZE;
>  		if (npages >= maxpages)
>  			return maxpages;
> -	})
> +	}),
> +	0
>  	)
>  	return npages;
>  }
> @@ -1644,7 +1906,7 @@ const void *dup_iter(struct iov_iter *new, struct iov_iter *old, gfp_t flags)
>  		WARN_ON(1);
>  		return NULL;
>  	}
> -	if (unlikely(iov_iter_is_discard(new)))
> +	if (unlikely(iov_iter_is_discard(new) || iov_iter_is_xarray(new)))
>  		return NULL;
>  	if (iov_iter_is_bvec(new))
>  		return new->bvec = kmemdup(new->bvec,
> @@ -1849,7 +2111,12 @@ int iov_iter_for_each_range(struct iov_iter *i, size_t bytes,
>  		kunmap(v.bv_page);
>  		err;}), ({
>  		w = v;
> -		err = f(&w, context);})
> +		err = f(&w, context);}), ({
> +		w.iov_base = kmap(v.bv_page) + v.bv_offset;
> +		w.iov_len = v.bv_len;
> +		err = f(&w, context);
> +		kunmap(v.bv_page);
> +		err;})
>  	)
>  	return err;
>  }
> 
> 

I think you've planned to remove iov_iter_for_each_range as well? I'll
assume that this is going away. It might be nice to post the latest
version of this patch with that change, just for posterity.

In any case, this all looks reasonable to me, modulo a few nits and a
general dearth of comments.

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

