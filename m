Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A288A488205
	for <lists+linux-cachefs@lfdr.de>; Sat,  8 Jan 2022 08:09:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-HpvIyspOP1ioFB4PgMSdeQ-1; Sat, 08 Jan 2022 02:09:26 -0500
X-MC-Unique: HpvIyspOP1ioFB4PgMSdeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D025D801B26;
	Sat,  8 Jan 2022 07:09:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15493131F7;
	Sat,  8 Jan 2022 07:09:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9CB34BB7C;
	Sat,  8 Jan 2022 07:09:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20879BDm029949 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 8 Jan 2022 02:09:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C4C040CFD37; Sat,  8 Jan 2022 07:09:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7747F40CFD07
	for <linux-cachefs@redhat.com>; Sat,  8 Jan 2022 07:09:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C9A185A5A8
	for <linux-cachefs@redhat.com>; Sat,  8 Jan 2022 07:09:11 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-467-oBG0cSsIM4qawHH0_12sbQ-1; Sat, 08 Jan 2022 02:09:09 -0500
X-MC-Unique: oBG0cSsIM4qawHH0_12sbQ-1
Received: by mail-io1-f45.google.com with SMTP id j1so152955iob.1;
	Fri, 07 Jan 2022 23:09:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sRXzK/lqvK+CkfJ0q4743gkEDTMH9u4vG56Fc2vaE/U=;
	b=dckBDORNJGqIRJbmmzOENcsaiAj4M8FOWq66zipYOWpjkrk8b4jTeh42xlVZ00JPnr
	IUFdDVRnAzybemgD7DYC5lhZm4I7W3M/btxC1AslpOXP1QAjhHGvYULnY2giKQAzGmi8
	hrLtvemfIUyGD6ykR7m4nhYbx+9ke7iGBxxqgSw7b9QmS3IlBOZGNkrqySranvyPZUqU
	AHYxsqLY4kndlEdDZs1Qko3rvFf4awxAmkwxE0menEOEoozX3CzOdQ+0F+VfQp7uJ4JW
	bxSGFOW5hcTUpAtrfE502HOqMUGxVNXuyiqY7+Zu26IQymnbouXoSFQW7NgCbPxX7paO
	0+CQ==
X-Gm-Message-State: AOAM530EuguYH6ltQ5GHVm+EwkxBtsegBacUi3ktuVJBnZLeVrZewbaW
	9O7Dw5FuayjX8u+z0T9RVWaAhE6fZJdxMSUqYHX4hYs58tw=
X-Google-Smtp-Source: ABdhPJx+/bHNQi2TJrW6OyIV2QCN1CKOeiSpIVesRRe2vCRlhJscDWjlBTocK3a12pB+qw5jpsCC+o53g/Y1aGq5M88=
X-Received: by 2002:a05:6638:160c:: with SMTP id
	x12mr33388634jas.1.1641625748333; 
	Fri, 07 Jan 2022 23:09:08 -0800 (PST)
MIME-Version: 1.0
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021541207.640689.564689725898537127.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021541207.640689.564689725898537127.stgit@warthog.procyon.org.uk>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 8 Jan 2022 09:08:57 +0200
Message-ID: <CAOQ4uxjEcvffv=rNXS-r+NLz+=6yk4abRuX_AMq9v-M4nf_PtA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel <ceph-devel@vger.kernel.org>,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 25, 2021 at 1:32 AM David Howells <dhowells@redhat.com> wrote:
>
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
>         cache.o \
>         daemon.o \
>         main.o \
> +       namei.o \
>         security.o
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
> +                                          struct dentry *dentry)
> +{
> +       struct inode *inode = d_backing_inode(dentry);
> +       bool can_use = false;
> +
> +       if (!(inode->i_flags & S_KERNEL_FILE)) {
> +               inode->i_flags |= S_KERNEL_FILE;
> +               trace_cachefiles_mark_active(object, inode);
> +               can_use = true;
> +       } else {
> +               pr_notice("cachefiles: Inode already in use: %pd\n", dentry);
> +       }
> +
> +       return can_use;
> +}
> +
> +/*
> + * Unmark a backing inode.  The caller must hold the inode lock.
> + */
> +static void __cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
> +                                            struct dentry *dentry)
> +{
> +       struct inode *inode = d_backing_inode(dentry);
> +
> +       inode->i_flags &= ~S_KERNEL_FILE;
> +       trace_cachefiles_mark_inactive(object, inode);
> +}
> diff --git a/fs/namei.c b/fs/namei.c
> index 1f9d2187c765..d81f04f8d818 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -3958,7 +3958,8 @@ int vfs_rmdir(struct user_namespace *mnt_userns, struct inode *dir,
>         inode_lock(dentry->d_inode);
>
>         error = -EBUSY;
> -       if (is_local_mountpoint(dentry))
> +       if (is_local_mountpoint(dentry) ||
> +           (dentry->d_inode->i_flags & S_KERNEL_FILE))

Better as this check to the many other checks in may_delete()

>                 goto out;
>
>         error = security_inode_rmdir(dir, dentry);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 2c0b8e77d9ab..bcf1ca430139 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2249,6 +2249,7 @@ struct super_operations {
>  #define S_ENCRYPTED    (1 << 14) /* Encrypted file (using fs/crypto/) */
>  #define S_CASEFOLD     (1 << 15) /* Casefolded file */
>  #define S_VERITY       (1 << 16) /* Verity file (using fs/verity/) */
> +#define S_KERNEL_FILE  (1 << 17) /* File is in use by the kernel (eg. fs/cachefiles) */
>

Trying to brand this flag as a generic "in use by kernel" is misleading.
Modules other than cachefiles cannot set/clear this flag, because then
cachefiles won't know that it is allowed to set/clear the flag.

So I think it would be better to call it for what it really is - an inode flag
that is controlled by cachefiles.
Also, the name KERNEL_FILE for a directory is a bit confusing IMO.
Perhaps S_CACHEFILES?

Thanks,
Amir.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

