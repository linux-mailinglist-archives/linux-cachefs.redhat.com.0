Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14217486817
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Jan 2022 18:04:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-bZpBNkQ2P7uX0g11xfZBqg-1; Thu, 06 Jan 2022 12:04:27 -0500
X-MC-Unique: bZpBNkQ2P7uX0g11xfZBqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 890E7192CC42;
	Thu,  6 Jan 2022 17:04:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C07118379D;
	Thu,  6 Jan 2022 17:04:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B8991806D1C;
	Thu,  6 Jan 2022 17:04:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206H4InF006753 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 12:04:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B82E1417201; Thu,  6 Jan 2022 17:04:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37277140EBFE
	for <linux-cachefs@redhat.com>; Thu,  6 Jan 2022 17:04:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D719811E78
	for <linux-cachefs@redhat.com>; Thu,  6 Jan 2022 17:04:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-634-EcBSXiADOdSzBJ9lTtME8A-1; Thu, 06 Jan 2022 12:04:16 -0500
X-MC-Unique: EcBSXiADOdSzBJ9lTtME8A-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6397E61D06;
	Thu,  6 Jan 2022 17:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAA3C36AE3;
	Thu,  6 Jan 2022 17:04:13 +0000 (UTC)
Message-ID: <88d7f8970dcc0fd0ead891b1f42f160b8d17d60e.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Thu, 06 Jan 2022 12:04:12 -0500
In-Reply-To: <164021541207.640689.564689725898537127.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021541207.640689.564689725898537127.stgit@warthog.procyon.org.uk>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	Torvalds <torvalds@linux-foundation.org>,
	Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Omar Sandoval <osandov@osandov.com>, Linus,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 38/68] vfs,
 cachefiles: Mark a backing file in use with an inode flag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-12-22 at 23:23 +0000, David Howells wrote:
> Use an inode flag, S_KERNEL_FILE, to mark that a backing file is in use by
> the kernel to prevent cachefiles or other kernel services from interfering
> with that file.
> 
> Alter rmdir to reject attempts to remove a directory marked with this flag.
> This is used by cachefiles to prevent cachefilesd from removing them.
> 
> Using S_SWAPFILE instead isn't really viable as that has other effects in
> the I/O paths.
> 
> Changes
> =======
> ver #3:
>  - Check for the object pointer being NULL in the tracepoints rather than
>    the caller.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> Link: https://lore.kernel.org/r/163819630256.215744.4815885535039369574.stgit@warthog.procyon.org.uk/ # v1
> Link: https://lore.kernel.org/r/163906931596.143852.8642051223094013028.stgit@warthog.procyon.org.uk/ # v2
> Link: https://lore.kernel.org/r/163967141000.1823006.12920680657559677789.stgit@warthog.procyon.org.uk/ # v3
> ---
> 
>  fs/cachefiles/Makefile            |    1 +
>  fs/cachefiles/namei.c             |   43 +++++++++++++++++++++++++++++++++++++
>  fs/namei.c                        |    3 ++-
>  include/linux/fs.h                |    1 +
>  include/trace/events/cachefiles.h |   42 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 fs/cachefiles/namei.c
> 
> diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
> index 463e3d608b75..e0b092ca077f 100644
> --- a/fs/cachefiles/Makefile
> +++ b/fs/cachefiles/Makefile
> @@ -7,6 +7,7 @@ cachefiles-y := \
>  	cache.o \
>  	daemon.o \
>  	main.o \
> +	namei.o \
>  	security.o
>  
>  cachefiles-$(CONFIG_CACHEFILES_ERROR_INJECTION) += error_inject.o
> diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
> new file mode 100644
> index 000000000000..913f83f1c900
> --- /dev/null
> +++ b/fs/cachefiles/namei.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* CacheFiles path walking and related routines
> + *
> + * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + */
> +
> +#include <linux/fs.h>
> +#include "internal.h"
> +
> +/*
> + * Mark the backing file as being a cache file if it's not already in use.  The
> + * mark tells the culling request command that it's not allowed to cull the
> + * file or directory.  The caller must hold the inode lock.
> + */
> +static bool __cachefiles_mark_inode_in_use(struct cachefiles_object *object,
> +					   struct dentry *dentry)
> +{
> +	struct inode *inode = d_backing_inode(dentry);
> +	bool can_use = false;
> +
> +	if (!(inode->i_flags & S_KERNEL_FILE)) {

nit: most of the other S_* flags have a corresponding IS_* macro. Should
this be:

    IS_KERNEL_FILE(inode)

?

> +		inode->i_flags |= S_KERNEL_FILE;
> +		trace_cachefiles_mark_active(object, inode);
> +		can_use = true;
> +	} else {
> +		pr_notice("cachefiles: Inode already in use: %pd\n", dentry);
> +	}
> +
> +	return can_use;
> +}
> +
> +/*
> + * Unmark a backing inode.  The caller must hold the inode lock.
> + */
> +static void __cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
> +					     struct dentry *dentry)
> +{
> +	struct inode *inode = d_backing_inode(dentry);
> +
> +	inode->i_flags &= ~S_KERNEL_FILE;
> +	trace_cachefiles_mark_inactive(object, inode);
> +}
> diff --git a/fs/namei.c b/fs/namei.c
> index 1f9d2187c765..d81f04f8d818 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -3958,7 +3958,8 @@ int vfs_rmdir(struct user_namespace *mnt_userns, struct inode *dir,
>  	inode_lock(dentry->d_inode);
>  
>  	error = -EBUSY;
> -	if (is_local_mountpoint(dentry))
> +	if (is_local_mountpoint(dentry) ||
> +	    (dentry->d_inode->i_flags & S_KERNEL_FILE))
>  		goto out;
>  
>  	error = security_inode_rmdir(dir, dentry);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 2c0b8e77d9ab..bcf1ca430139 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2249,6 +2249,7 @@ struct super_operations {
>  #define S_ENCRYPTED	(1 << 14) /* Encrypted file (using fs/crypto/) */
>  #define S_CASEFOLD	(1 << 15) /* Casefolded file */
>  #define S_VERITY	(1 << 16) /* Verity file (using fs/verity/) */
> +#define S_KERNEL_FILE	(1 << 17) /* File is in use by the kernel (eg. fs/cachefiles) */
>  
>  /*
>   * Note that nosuid etc flags are inode-specific: setting some file-system
> diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
> index 9bd5a8a60801..6331cd29880d 100644
> --- a/include/trace/events/cachefiles.h
> +++ b/include/trace/events/cachefiles.h
> @@ -83,6 +83,48 @@ cachefiles_error_traces;
>  #define E_(a, b)	{ a, b }
>  
>  
> +TRACE_EVENT(cachefiles_mark_active,
> +	    TP_PROTO(struct cachefiles_object *obj,
> +		     struct inode *inode),
> +
> +	    TP_ARGS(obj, inode),
> +
> +	    /* Note that obj may be NULL */
> +	    TP_STRUCT__entry(
> +		    __field(unsigned int,		obj		)
> +		    __field(ino_t,			inode		)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->obj	= obj ? obj->debug_id : 0;
> +		    __entry->inode	= inode->i_ino;
> +			   ),
> +
> +	    TP_printk("o=%08x i=%lx",
> +		      __entry->obj, __entry->inode)
> +	    );
> +
> +TRACE_EVENT(cachefiles_mark_inactive,
> +	    TP_PROTO(struct cachefiles_object *obj,
> +		     struct inode *inode),
> +
> +	    TP_ARGS(obj, inode),
> +
> +	    /* Note that obj may be NULL */
> +	    TP_STRUCT__entry(
> +		    __field(unsigned int,		obj		)
> +		    __field(ino_t,			inode		)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->obj	= obj ? obj->debug_id : 0;
> +		    __entry->inode	= inode->i_ino;
> +			   ),
> +
> +	    TP_printk("o=%08x i=%lx",
> +		      __entry->obj, __entry->inode)
> +	    );
> +
>  TRACE_EVENT(cachefiles_vfs_error,
>  	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer,
>  		     int error, enum cachefiles_error_trace where),
> 
> 

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

