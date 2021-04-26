Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE3A536B7E6
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 19:17:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-tusnvx8DOnmYu06HKdSvyA-1; Mon, 26 Apr 2021 13:17:47 -0400
X-MC-Unique: tusnvx8DOnmYu06HKdSvyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C79B1107ACC7;
	Mon, 26 Apr 2021 17:17:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E19DB5D9DE;
	Mon, 26 Apr 2021 17:17:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 847734ED86;
	Mon, 26 Apr 2021 17:17:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QHHYnd007807 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 13:17:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 658C02094D08; Mon, 26 Apr 2021 17:17:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 601552094D05
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 17:17:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C67DEA28816
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 17:17:30 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-342-lTLfVtoyO1uZlZp8wxA-Zw-1; Mon, 26 Apr 2021 13:17:25 -0400
X-MC-Unique: lTLfVtoyO1uZlZp8wxA-Zw-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lb4ob-008SGJ-Lx; Mon, 26 Apr 2021 17:14:33 +0000
Date: Mon, 26 Apr 2021 17:14:33 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Message-ID: <YIb0+b7VJJrrofCB@zeniv-ca.linux.org.uk>
References: <161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<3545034.1619392490@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3545034.1619392490@warthog.procyon.org.uk>
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
Subject: Re: [Linux-cachefs] [PATCH] iov_iter: Four fixes for ITER_XARRAY
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 26, 2021 at 12:14:50AM +0100, David Howells wrote:
> Hi Al,
> 
> I think this patch should include all the fixes necessary.  I could merge
> it in, but I think it might be better to tag it on the end as an additional
> patch.

Looks sane, but I wonder if it would've been better to deal with this

> @@ -791,6 +791,8 @@ size_t _copy_mc_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
>  			curr_addr = (unsigned long) from;
>  			bytes = curr_addr - s_addr - rem;
>  			rcu_read_unlock();
> +			i->iov_offset += bytes;
> +			i->count -= bytes;
>  			return bytes;
>  		}
>  		})

by having your iterator check the return value of X callback and, having
decremented .bv_len by return value, broke out of the loop.

       __label__ __bugger_off;

       xas_for_each(&xas, head, ULONG_MAX) {                           \
               if (xas_retry(&xas, head))                              \
                       continue;                                       \
               if (WARN_ON(xa_is_value(head)))                         \
                       break;                                          \
               if (WARN_ON(PageHuge(head)))                            \
                       break;                                          \
               for (j = (head->index < index) ? index - head->index : 0; \
                    j < thp_nr_pages(head); j++) {                     \
                       __v.bv_page = head + j;                         \

			size_t left;

                       offset = (i->xarray_start + skip) & ~PAGE_MASK; \
                       seg = PAGE_SIZE - offset;                       \
                       __v.bv_offset = offset;                         \
                       __v.bv_len = min(n, seg);                       \

                       left = (STEP);
		       __v.bv_len -= left;

                       n -= __v.bv_len;                                \
                       skip += __v.bv_len;                             \

		       if (!n || left)
				goto __bugger_off;

               }                                                       \
               if (n == 0)                                             \
                       break;                                          \
       }                                                       \

__bugger_off:


Then rename iterate_and_advance() to __iterate_and_advance() and have
#define iterate_and_advance(....., X) __iterate_and_advance(....., ((void)(X),0))
with iterate_all_kinds() using iterate_xarray(....,((void)(X),0)

Then _copy_mc_to_iter() could use __iterate_and_advance(), getting rid of
the need of doing anything special in case of short copy.  OTOH, I can do
that myself in a followup - not a problem.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

