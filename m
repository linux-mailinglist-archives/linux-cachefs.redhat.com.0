Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D03631DD42
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 17:25:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-E5y8--9EPsu7qTSU7MYoUQ-1; Wed, 17 Feb 2021 11:25:48 -0500
X-MC-Unique: E5y8--9EPsu7qTSU7MYoUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12280801988;
	Wed, 17 Feb 2021 16:25:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 457D15C1A3;
	Wed, 17 Feb 2021 16:25:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A789018095CB;
	Wed, 17 Feb 2021 16:25:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HGHkKM026486 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 11:17:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C520C2026D46; Wed, 17 Feb 2021 16:17:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C08542018644
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 16:17:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3703F185A7BC
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 16:17:44 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-158-rjHjJphkOtGETvRwNRqdCQ-1; Wed, 17 Feb 2021 11:17:40 -0500
X-MC-Unique: rjHjJphkOtGETvRwNRqdCQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lCPSg-000e1H-2j; Wed, 17 Feb 2021 16:14:28 +0000
Date: Wed, 17 Feb 2021 16:13:58 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210217161358.GM2858050@casper.infradead.org>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<161340389201.1303470.14353807284546854878.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161340389201.1303470.14353807284546854878.stgit@warthog.procyon.org.uk>
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [PATCH 03/33] mm: Implement readahead_control
	pageset expansion
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 15, 2021 at 03:44:52PM +0000, David Howells wrote:
> +++ b/include/linux/pagemap.h
> @@ -761,6 +761,8 @@ extern void __delete_from_page_cache(struct page *page, void *shadow);
>  int replace_page_cache_page(struct page *old, struct page *new, gfp_t gfp_mask);
>  void delete_from_page_cache_batch(struct address_space *mapping,
>  				  struct pagevec *pvec);
> +void readahead_expand(struct readahead_control *ractl,
> +		      loff_t new_start, size_t new_len);

If we're revising this patchset, I'd rather this lived with the other
readahead declarations, ie after the definition of readahead_control.

> +	/* Expand the trailing edge upwards */
> +	while (ractl->_nr_pages < new_nr_pages) {
> +		unsigned long index = ractl->_index + ractl->_nr_pages;
> +		struct page *page = xa_load(&mapping->i_pages, index);
> +
> +		if (page && !xa_is_value(page))
> +			return; /* Page apparently present */
> +
> +		page = __page_cache_alloc(gfp_mask);
> +		if (!page)
> +			return;
> +		if (add_to_page_cache_lru(page, mapping, index, gfp_mask) < 0) {
> +			put_page(page);
> +			return;
> +		}
> +		ractl->_nr_pages++;
> +	}

We're defeating the ondemand_readahead() algorithm here.  Let's suppose
userspace is doing 64kB reads, the filesystem is OrangeFS which only
wants to do 4MB reads, the page cache is initially empty and there's
only one thread doing a sequential read.  ondemand_readahead() calls
get_init_ra_size() which tells it to allocate 128kB and set the async
marker at 64kB.  Then orangefs calls readahead_expand() to allocate the
remainder of the 4MB.  After the app has read the first 64kB, it comes
back to read the next 64kB, sees the readahead marker and tries to trigger
the next batch of readahead, but it's already present, so it does nothing
(see page_cache_ra_unbounded() for what happens with pages present).

Then it keeps going through the 4MB that's been read, not seeing any more
readahead markers, gets to 4MB and asks for ... 256kB?  Not quite sure.
Anyway, it then has to wait for the next 4MB because the readahead didn't
overlap with the application processing.

So readahead_expand() needs to adjust the file's f_ra so that when the
application gets to 64kB, it kicks off the readahead of 4MB-8MB chunk (and
then when we get to 4MB+256kB, it kicks off the readahead of 8MB-12MB,
and so on).

Unless someone sees a better way to do this?  I don't
want to inadvertently break POSIX_FADV_WILLNEED which calls
force_page_cache_readahead() and should not perturb the kernel's
ondemand algorithm.  Perhaps we need to add an 'ra' pointer to the
ractl to indicate whether the file_ra_state should be updated by
readahead_expand()?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

