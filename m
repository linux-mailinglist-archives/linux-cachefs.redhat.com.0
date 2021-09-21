Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 78E66413273
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Sep 2021 13:22:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-imP_V0WWNluUgWWAQFXokg-1; Tue, 21 Sep 2021 07:22:06 -0400
X-MC-Unique: imP_V0WWNluUgWWAQFXokg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BEF5100D075;
	Tue, 21 Sep 2021 11:22:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52C027E464;
	Tue, 21 Sep 2021 11:22:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BC354E58F;
	Tue, 21 Sep 2021 11:21:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18LBFpfg021571 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 21 Sep 2021 07:15:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A95821449B1; Tue, 21 Sep 2021 11:15:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1532E21449AD
	for <linux-cachefs@redhat.com>; Tue, 21 Sep 2021 11:15:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C2BD800883
	for <linux-cachefs@redhat.com>; Tue, 21 Sep 2021 11:15:47 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-209-SdSsvsdGM7qCKFfnKElVAg-1; Tue, 21 Sep 2021 07:15:44 -0400
X-MC-Unique: SdSsvsdGM7qCKFfnKElVAg-1
Received: by nautica.notk.org (Postfix, from userid 108)
	id A28D1C01F; Tue, 21 Sep 2021 13:15:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id 337E1C009;
	Tue, 21 Sep 2021 13:15:36 +0200 (CEST)
Received: from localhost (odin.codewreck.org [local])
	by odin.codewreck.org (OpenSMTPD) with ESMTPA id a7c0d52c;
	Tue, 21 Sep 2021 11:15:33 +0000 (UTC)
Date: Tue, 21 Sep 2021 20:15:18 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YUm+xucHxED+1MJp@codewreck.org>
References: <163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
	<163162772646.438332.16323773205855053535.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <163162772646.438332.16323773205855053535.stgit@warthog.procyon.org.uk>
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 4/8] 9p: (untested) Convert to using the
 netfs helper lib to do reads and caching
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

David Howells wrote on Tue, Sep 14, 2021 at 02:55:26PM +0100:
> 9p: (untested) Convert to using the netfs helper lib to do reads and caching

Finally tested to some extent: let's remove that (untested) tag.


> Convert the 9p filesystem to use the netfs helper lib to handle readpage,
> readahead and write_begin, converting those into a common issue_op for the
> filesystem itself to handle.  The netfs helper lib also handles reading
> from fscache if a cache is available, and interleaving reads from both
> sources.
> 
> This change also switches from the old fscache I/O API to the new one,
> meaning that fscache no longer keeps track of netfs pages and instead does
> async DIO between the backing files and the 9p file pagecache.  As a part
> of this change, the handling of PG_fscache changes.  It now just means that
> the cache has a write I/O operation in progress on a page (PG_locked
> is used for a read I/O op).
> 
> Note that this is a cut-down version of the fscache rewrite and does not
> change any of the cookie and cache coherency handling.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Dominique Martinet <asmadeus@codewreck.org>

can add either my sob or a reviewed-by tag from me instead.
I'm honestly not familiar enough with some of the changes (parts
checking PAGE_SIZE or similar) but I didn't spot any obvious error
except the few ifdefs I commented on below, and will keep running a few
more tests until next merge window.

> cc: v9fs-developer@lists.sourceforge.net
> cc: linux-cachefs@redhat.com
> ---
> 
>  fs/9p/Kconfig    |    1 
>  fs/9p/cache.c    |  137 -------------------------------------------
>  fs/9p/cache.h    |   99 +------------------------------
>  fs/9p/v9fs.h     |    9 +++
>  fs/9p/vfs_addr.c |  174 ++++++++++++++++++++++++------------------------------
>  fs/9p/vfs_file.c |   21 +++++--
>  6 files changed, 108 insertions(+), 333 deletions(-)
> 
> diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
> index cce9ace651a2..a7e080916826 100644
> --- a/fs/9p/vfs_addr.c
> +++ b/fs/9p/vfs_addr.c
> @@ -124,7 +117,14 @@ static int v9fs_release_page(struct page *page, gfp_t gfp)
>  {
>  	if (PagePrivate(page))
>  		return 0;
> -	return v9fs_fscache_release_page(page, gfp);
> +#ifdef CONFIG_AFS_FSCACHE

s/AFS/9P/

> +	if (PageFsCache(page)) {
> +		if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))
> +			return 0;
> +		wait_on_page_fscache(page);
> +	}
> +#endif
> +	return 1;
>  }
>  
>  /**
> diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
> index aab5e6538660..4b617d10cf28 100644
> --- a/fs/9p/vfs_file.c
> +++ b/fs/9p/vfs_file.c
> @@ -542,14 +542,27 @@ v9fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	p9_debug(P9_DEBUG_VFS, "page %p fid %lx\n",
>  		 page, (unsigned long)filp->private_data);
>  
> +	v9inode = V9FS_I(inode);
> +
> +	/* Wait for the page to be written to the cache before we allow it to
> +	 * be modified.  We then assume the entire page will need writing back.
> +	 */
> +#ifdef CONFIG_V9FS_FSCACHE

s/V9FS/9P/


-- 
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

