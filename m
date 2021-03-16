Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F09133DD20
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 Mar 2021 20:07:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-IsKk3pxyOniF_synaBGw3g-1; Tue, 16 Mar 2021 15:07:36 -0400
X-MC-Unique: IsKk3pxyOniF_synaBGw3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A75661083E98;
	Tue, 16 Mar 2021 19:07:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A48D6091A;
	Tue, 16 Mar 2021 19:07:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B74F1800657;
	Tue, 16 Mar 2021 19:07:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12GJ7RAF023359 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 15:07:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83F00AB583; Tue, 16 Mar 2021 19:07:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C0FB9D490
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 19:07:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DAE084853B
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 19:07:19 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-564-wTT4-O1ZO3ms0f_v7NpGGw-1; Tue, 16 Mar 2021 15:07:12 -0400
X-MC-Unique: wTT4-O1ZO3ms0f_v7NpGGw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lMF23-000UZR-6Y; Tue, 16 Mar 2021 19:07:08 +0000
Date: Tue, 16 Mar 2021 19:07:07 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210316190707.GD3420@casper.infradead.org>
References: <161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [PATCH v4 02/28] mm: Add an unlock function for
 PG_private_2/PG_fscache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 10, 2021 at 04:54:49PM +0000, David Howells wrote:
> Add a function, unlock_page_private_2(), to unlock PG_private_2 analogous
> to that of PG_lock.  Add a kerneldoc banner to that indicating the example
> usage case.

This isn't a problem with this patch per se, but I'm concerned about
private2 and expected page refcounts.

static inline int is_page_cache_freeable(struct page *page)
{
        /*
         * A freeable page cache page is referenced only by the caller
         * that isolated the page, the page cache and optional buffer
         * heads at page->private.
         */
        int page_cache_pins = thp_nr_pages(page);
        return page_count(page) - page_has_private(page) == 1 + page_cache_pins;
}

static inline int page_has_private(struct page *page)
{
        return !!(page->flags & PAGE_FLAGS_PRIVATE);
}

#define PAGE_FLAGS_PRIVATE                              \
        (1UL << PG_private | 1UL << PG_private_2)

So ... a page with both flags cleared should have a refcount of N.
A page with one or both flags set should have a refcount of N+1.

How is a poor filesystem supposed to make that true?  Also btrfs has this
problem since it uses private_2 for its own purposes.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

