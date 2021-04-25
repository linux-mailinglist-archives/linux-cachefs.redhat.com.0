Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5833D36A772
	for <lists+linux-cachefs@lfdr.de>; Sun, 25 Apr 2021 15:14:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-j1VHWeerPtWNrpoAHDj0-g-1; Sun, 25 Apr 2021 09:14:38 -0400
X-MC-Unique: j1VHWeerPtWNrpoAHDj0-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CC8E87A82A;
	Sun, 25 Apr 2021 13:14:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9493662464;
	Sun, 25 Apr 2021 13:14:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E9B44ED79;
	Sun, 25 Apr 2021 13:14:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13PDEPnk021971 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 25 Apr 2021 09:14:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C36F21602BA; Sun, 25 Apr 2021 13:14:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6703221602B7
	for <linux-cachefs@redhat.com>; Sun, 25 Apr 2021 13:14:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53C45858F0D
	for <linux-cachefs@redhat.com>; Sun, 25 Apr 2021 13:14:22 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-567-3T1ezVU0NciOwIzDYjJQ-Q-1; Sun, 25 Apr 2021 09:14:17 -0400
X-MC-Unique: 3T1ezVU0NciOwIzDYjJQ-Q-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1laeaT-008ABu-Dy; Sun, 25 Apr 2021 13:14:13 +0000
Date: Sun, 25 Apr 2021 13:14:13 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Message-ID: <YIVrJT8GwLI0Wlgx@zeniv-ca.linux.org.uk>
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Dominique Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v7 01/31] iov_iter: Add ITER_XARRAY
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 23, 2021 at 02:28:01PM +0100, David Howells wrote:

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

What is that chunk for?

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

For the record - these forests of macros had been my mistake.  I'm trying
to get rid of that crap right now, but your changes don't look likely to be
trouble in that respect.


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

That's broken, same way as kvec and bvec cases are in the same primitive.
Iterator not advanced on failure halfway through.

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

Hmm...  That looks like a really bad overkill - do you need anything beyond count and
iov_offset in that case + perhaps "do we have the very last page"?  IOW, do you need
to iterate anything at all here?  What am I missing here?

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

Very limited use; it shouldn't be called for anything other than IOV_ITER case.

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

Would be easier to have that sucker removed first...

Anyway, I can live with that; the only real bug is in sodding _copy_mc_to_iter(),
it's not anything new and it can be fixed at the same time we deal with kvec and
bvec cases there.  Which, unfortunately, requires untangling the macro mess ;-/

What I've got in a local branch right now is
	* removal of iov_iter_for_each_range() (yours, BTW)
	* separation of flavour and direction (and the end of pseudo-bitmaps)
	* untangling and optimizing iov_iter_advance(); iovec/kvec cases are
switched to the logics similar to bvec_iter_advance(), get considerably smaller
and should be faster
	* fixing ITER_DISCARD iov_iter_advance() - move past the end should
quietly stop at the end.
	* getting rid of iterate_all_kinds() in iov_iter_alignment(),
iov_iter_gap_alignment(), iov_iter_get_pages() and iov_iter_get_pages_alloc().

After that the only remaining irregular case of iterate_all_kinds() is in
iov_iter_npages(); that's what I'm trying to sort out right now.  With that
done, all remaining uses will be for copying-style primitives, same as for
iterate_and_advance().  What I want to try after that is a separate "tracking"
argument, so that e.g. in _copy_to_iter() we'd have
        iterate_and_advance(i, bytes, from, v,
                copyout(v.iov_base, from, v.iov_len),
                memcpy_to_page(v.bv_page, v.bv_offset, from, v.bv_len),
                memcpy(v.iov_base, from, v.iov_len)
        )
Next step will be to teach the damn thing about the possibility of short
copies in kvec/bvec cases.  We'd get
#define iterate_and_advance(i, n, p, v, I, K, B) \
	__iterate_and_advance(i, n, p, v, I, (K, 0), (B, 0))
and AFAICS it can be done in a way that won't screw code generation for
the normal ones.  At that point _copy_mc_to_iter() mess gets cleared *AND*
we can merge K and B callbacks, handling B as kmap_atomic + K + kunmap_atomic
(_copy_mc_to_iter() is the main obstacle to that).  Your callback (X) would
also fold into that.

After that I want to try and see how well iov_iter_advance() got optimized
and see if we can get e.g. _copy_to_iter() simply to

        iterate_all_kinds(i, bytes, from, v,
                copyout(v.iov_base, from, v.iov_len),
                memcpy(v.iov_base, from, v.iov_len)
        )
	iov_iter_advance(i, from - addr);
	return from - addr;
If iov_iter_advance() ends up being too much overhead - oh, well, we'll keep
iterate_and_advance() along with iterate_all_kinds().  Needs profiling,
obviously.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

