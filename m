Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE1488A34
	for <lists+linux-cachefs@lfdr.de>; Sun,  9 Jan 2022 16:28:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-9adUxURlOE-sFKin5Ol5dw-1; Sun, 09 Jan 2022 10:27:58 -0500
X-MC-Unique: 9adUxURlOE-sFKin5Ol5dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 866A32ED7;
	Sun,  9 Jan 2022 15:27:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B4447ED93;
	Sun,  9 Jan 2022 15:27:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C99241809CB8;
	Sun,  9 Jan 2022 15:27:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 209FRYRT014446 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 9 Jan 2022 10:27:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0D9E5400E124; Sun,  9 Jan 2022 15:27:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0950B401A992
	for <linux-cachefs@redhat.com>; Sun,  9 Jan 2022 15:27:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E45FC800B21
	for <linux-cachefs@redhat.com>; Sun,  9 Jan 2022 15:27:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-547-GHNZNmawPhKH-9E0QH5erw-1; Sun, 09 Jan 2022 10:27:30 -0500
X-MC-Unique: GHNZNmawPhKH-9E0QH5erw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AF8460A55;
	Sun,  9 Jan 2022 15:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEB8C36AED;
	Sun,  9 Jan 2022 15:27:27 +0000 (UTC)
Message-ID: <6e44856a8711bf1eb95c16de9efdb1bb108cf25c.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com, Steve
	French <sfrench@samba.org>
Date: Sun, 09 Jan 2022 10:27:25 -0500
In-Reply-To: <3419813.1641592362@warthog.procyon.org.uk>
References: <164021579335.640689.2681324337038770579.stgit@warthog.procyon.org.uk>
	<164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<3419813.1641592362@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 63/68] cifs: Support fscache indexing
 rewrite (untested)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2022-01-07 at 21:52 +0000, David Howells wrote:
> This patch isn't quite right and needs a fix.  The attached patch fixes it.
> I'll fold that in and post a v5 of this patch.
> 
> David
> ---
> cifs: Fix the fscache cookie management
> 
> Fix the fscache cookie management in cifs in the following ways:
> 
>  (1) The cookie should be released in cifs_evict_inode() after it has been
>      unused from being pinned by cifs_set_page_dirty().
> 
>  (2) The cookie shouldn't be released in cifsFileInfo_put_final().  That's
>      dealing with closing a file, not getting rid of an inode.  The cookie
>      needs to persist beyond the last file close because writepages may
>      happen after closure.
> 
>  (3) The cookie needs to be used in cifs_atomic_open() to match
>      cifs_open().  As yet unknown files being opened for writing seem to go
>      by the former route rather than the latter.
> 
> This can be triggered by something like:
> 
>         # systemctl start cachefilesd
>         # mount //carina/test /xfstest.test -o user=shares,pass=xxxx.fsc
>         # bash 5</xfstest.test/bar
>         # echo hello >/xfstest.test/bar
> 
> The key is to open the file R/O and then open it R/W and write to it whilst
> it's still open for R/O.  A cookie isn't acquired if it's just opened R/W
> as it goes through the atomic_open method rather than the open method.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
>  fs/cifs/cifsfs.c |    8 ++++++++
>  fs/cifs/dir.c    |    4 ++++
>  fs/cifs/file.c   |    2 --
>  3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> index d3f3acf340f1..26cf2193c9a2 100644
> --- a/fs/cifs/cifsfs.c
> +++ b/fs/cifs/cifsfs.c
> @@ -398,6 +398,7 @@ cifs_evict_inode(struct inode *inode)
>  	truncate_inode_pages_final(&inode->i_data);
>  	if (inode->i_state & I_PINNING_FSCACHE_WB)
>  		cifs_fscache_unuse_inode_cookie(inode, true);
> +	cifs_fscache_release_inode_cookie(inode);
>  	clear_inode(inode);
>  }
>  
> @@ -722,6 +723,12 @@ static int cifs_show_stats(struct seq_file *s, struct dentry *root)
>  }
>  #endif
>  
> +static int cifs_write_inode(struct inode *inode, struct writeback_control *wbc)
> +{
> +	fscache_unpin_writeback(wbc, cifs_inode_cookie(inode));
> +	return 0;
> +}
> +
>  static int cifs_drop_inode(struct inode *inode)
>  {
>  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
> @@ -734,6 +741,7 @@ static int cifs_drop_inode(struct inode *inode)
>  static const struct super_operations cifs_super_ops = {
>  	.statfs = cifs_statfs,
>  	.alloc_inode = cifs_alloc_inode,
> +	.write_inode	= cifs_write_inode,
>  	.free_inode = cifs_free_inode,
>  	.drop_inode	= cifs_drop_inode,
>  	.evict_inode	= cifs_evict_inode,
> diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
> index 6e8e7cc26ae2..6186824b366e 100644
> --- a/fs/cifs/dir.c
> +++ b/fs/cifs/dir.c
> @@ -22,6 +22,7 @@
>  #include "cifs_unicode.h"
>  #include "fs_context.h"
>  #include "cifs_ioctl.h"
> +#include "fscache.h"
>  
>  static void
>  renew_parental_timestamps(struct dentry *direntry)
> @@ -509,6 +510,9 @@ cifs_atomic_open(struct inode *inode, struct dentry *direntry,
>  		rc = -ENOMEM;
>  	}
>  
> +	fscache_use_cookie(cifs_inode_cookie(file_inode(file)),
> +			   file->f_mode & FMODE_WRITE);
> +
>  out:
>  	cifs_put_tlink(tlink);
>  out_free_xid:
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index d872f6fe8e7d..44da7646f789 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -376,8 +376,6 @@ static void cifsFileInfo_put_final(struct cifsFileInfo *cifs_file)
>  	struct cifsLockInfo *li, *tmp;
>  	struct super_block *sb = inode->i_sb;
>  
> -	cifs_fscache_release_inode_cookie(inode);
> -
>  	/*
>  	 * Delete any outstanding lock records. We'll lose them when the file
>  	 * is closed anyway.
> 

Looks good.

Acked-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

