Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C64D6343203
	for <lists+linux-cachefs@lfdr.de>; Sun, 21 Mar 2021 11:53:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-ojUCQlS5Nr-DNB7jkBjggg-1; Sun, 21 Mar 2021 06:53:39 -0400
X-MC-Unique: ojUCQlS5Nr-DNB7jkBjggg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFD6D81746A;
	Sun, 21 Mar 2021 10:53:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9F885D72E;
	Sun, 21 Mar 2021 10:53:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67AB14BB7B;
	Sun, 21 Mar 2021 10:53:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12LArSvE019208 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 21 Mar 2021 06:53:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CCA71111A55; Sun, 21 Mar 2021 10:53:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5869E1111A54
	for <linux-cachefs@redhat.com>; Sun, 21 Mar 2021 10:53:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D804E80331A
	for <linux-cachefs@redhat.com>; Sun, 21 Mar 2021 10:53:25 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-61-0zUIaYV2MHOagfoUy2XLkA-1; Sun, 21 Mar 2021 06:53:20 -0400
X-MC-Unique: 0zUIaYV2MHOagfoUy2XLkA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lNvhl-007173-MX; Sun, 21 Mar 2021 10:53:12 +0000
Date: Sun, 21 Mar 2021 10:53:09 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210321105309.GG3420@casper.infradead.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

One of the things which confused me about this was ... where's the other
side?  Where's lock_page_private_2()?  Then I found this:

#ifdef CONFIG_AFS_FSCACHE
        if (PageFsCache(page) &&
            wait_on_page_bit_killable(page, PG_fscache) < 0)
                return VM_FAULT_RETRY;
#endif

Please respect the comment!

/*
 * This is exported only for wait_on_page_locked/wait_on_page_writeback, etc.,
 * and should not be used directly.
 */
extern void wait_on_page_bit(struct page *page, int bit_nr);
extern int wait_on_page_bit_killable(struct page *page, int bit_nr);

I think we need the exported API to be wait_on_page_private_2(), and
AFS needs to not tinker in the guts of filemap.  Otherwise you miss
out on bugfixes like c2407cf7d22d0c0d94cf20342b3b8f06f1d904e7 (see also
https://lore.kernel.org/linux-fsdevel/20210320054104.1300774-4-willy@infradead.org/T/#u
).

That also brings up that there is no set_page_private_2().  I think
that's OK -- you only set PageFsCache() immediately after reading the
page from the server.  But I feel this "unlock_page_private_2" is actually
"clear_page_private_2" -- ie it's equivalent to writeback, not to lock.

> +++ b/mm/filemap.c
> @@ -1432,6 +1432,26 @@ void unlock_page(struct page *page)
>  }
>  EXPORT_SYMBOL(unlock_page);
>  
> +/**
> + * unlock_page_private_2 - Unlock a page that's locked with PG_private_2
> + * @page: The page
> + *
> + * Unlocks a page that's locked with PG_private_2 and wakes up sleepers in
> + * wait_on_page_private_2().
> + *
> + * This is, for example, used when a netfs page is being written to a local
> + * disk cache, thereby allowing writes to the cache for the same page to be
> + * serialised.
> + */
> +void unlock_page_private_2(struct page *page)
> +{
> +	page = compound_head(page);
> +	VM_BUG_ON_PAGE(!PagePrivate2(page), page);
> +	clear_bit_unlock(PG_private_2, &page->flags);
> +	wake_up_page_bit(page, PG_private_2);
> +}
> +EXPORT_SYMBOL(unlock_page_private_2);
> +
>  /**

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

