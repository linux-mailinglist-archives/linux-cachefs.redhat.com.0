Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F644A4A9C
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 16:32:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-ubr_do5LPL6caG7WhXhxyw-1; Mon, 31 Jan 2022 10:32:29 -0500
X-MC-Unique: ubr_do5LPL6caG7WhXhxyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C69B1083F69;
	Mon, 31 Jan 2022 15:32:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F36A1091ED5;
	Mon, 31 Jan 2022 15:32:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EB924BB7B;
	Mon, 31 Jan 2022 15:32:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VFWO8G008335 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 10:32:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2E569404727C; Mon, 31 Jan 2022 15:32:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A48D4047272
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 15:32:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1068180A0B5
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 15:32:24 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-141-0rI5CO91Nvyc6aUIYQDW5g-1; Mon, 31 Jan 2022 10:32:20 -0500
X-MC-Unique: 0rI5CO91Nvyc6aUIYQDW5g-1
Received: by mail-il1-f182.google.com with SMTP id d3so11682006ilr.10;
	Mon, 31 Jan 2022 07:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jqx1HO/XId0GJ3ue+sgoNKZespsPL3K2xwqbKDpT4Z8=;
	b=U19sDjMvGYFGZeG2KFJ2C73U4rtpK4BGJfReOWJ8eEYuikaT1xL+XHHq+24DF45PxP
	F8RvSpmi9ckTt0AvDBraidsKUugmXZ1qaQ5vRtDtahbgM/BK9dvvPpWRnOjN81uidM5t
	zCAKqMlo91wYId6iMLHrjkjAts/1afNAuVV+HgLTnqtZJ5f1lRm8pq9+sSU2BSNUf1z/
	rbtCyEuxFuFUorpaMciO/Y0tpR4Ya4E2xv+q+ELP3w40YLBwL38Pz0VS32JOk/Ee919z
	8uc28wrN0WThNainOsHBdGQ6EdblX2+z2be6f8Sjmo7n3Xcieuec5xd57j72M3mNlf/Y
	dpxw==
X-Gm-Message-State: AOAM533Lah5ZZQHfX8WoV/WKIWlzWAKWZSJKx4GbhLxmnB9Ankdf96H8
	rL2rOuOVaS8WeV+lKhtajTzqZBXImrIM3ICucSGApUp4
X-Google-Smtp-Source: ABdhPJwDvsoSJdwvQcWZaoSVoJexMFalqqhyG9QHDWiAie63dyRK4SBo1tRqk0uaLKxRPgzVO3JyCZV8AP3wZBQMGx4=
X-Received: by 2002:a05:6e02:5cb:: with SMTP id
	l11mr13267786ils.198.1643643139591; 
	Mon, 31 Jan 2022 07:32:19 -0800 (PST)
MIME-Version: 1.0
References: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
	<164364202369.1476539.452557132083658522.stgit@warthog.procyon.org.uk>
In-Reply-To: <164364202369.1476539.452557132083658522.stgit@warthog.procyon.org.uk>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Jan 2022 17:32:08 +0200
Message-ID: <CAOQ4uxit42u7BSM_UAOc9gFsDb5b9JeEh1m_gCKMO7pxrtsAiA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Linux-cachefs] [PATCH 2/5] vfs: Add tracepoints for
	inode_excl_inuse_trylock/unlock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 31, 2022 at 5:13 PM David Howells <dhowells@redhat.com> wrote:
>
> Add tracepoints for inode_excl_inuse_trylock/unlock() to record successful
> and lock, failed lock, successful unlock and unlock when it wasn't locked.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Amir Goldstein <amir73il@gmail.com>
> cc: Miklos Szeredi <miklos@szeredi.hu>
> cc: linux-unionfs@vger.kernel.org
> cc: linux-cachefs@redhat.com
> ---
>
>  fs/inode.c           |   21 +++++++++++++++++----
>  fs/overlayfs/super.c |   10 ++++++----
>  include/linux/fs.h   |    9 +++++++--
>  3 files changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/fs/inode.c b/fs/inode.c
> index 954719f66113..61b93a89853f 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -22,6 +22,8 @@
>  #include <linux/iversion.h>
>  #include <trace/events/writeback.h>
>  #include "internal.h"
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/vfs.h>
>
>  /*
>   * Inode locking rules:
> @@ -2409,11 +2411,14 @@ EXPORT_SYMBOL(current_time);
>  /**
>   * inode_excl_inuse_trylock - Try to exclusively lock an inode for kernel access
>   * @dentry: Reference to the inode to be locked
> + * @o: Private reference for the kernel service
> + * @who: Which kernel service is trying to gain the lock
>   *
>   * Try to gain exclusive access to an inode for a kernel service, returning
>   * true if successful.
>   */
> -bool inode_excl_inuse_trylock(struct dentry *dentry)
> +bool inode_excl_inuse_trylock(struct dentry *dentry, unsigned int o,
> +                             enum inode_excl_inuse_by who)
>  {
>         struct inode *inode = d_inode(dentry);
>         bool locked = false;
> @@ -2421,7 +2426,10 @@ bool inode_excl_inuse_trylock(struct dentry *dentry)
>         spin_lock(&inode->i_lock);
>         if (!(inode->i_state & I_EXCL_INUSE)) {
>                 inode->i_state |= I_EXCL_INUSE;
> +               trace_inode_excl_inuse_lock(inode, o, who);
>                 locked = true;
> +       } else {
> +               trace_inode_excl_inuse_lock_failed(inode, o, who);
>         }
>         spin_unlock(&inode->i_lock);
>
> @@ -2432,18 +2440,23 @@ EXPORT_SYMBOL(inode_excl_inuse_trylock);
>  /**
>   * inode_excl_inuse_unlock - Unlock exclusive kernel access to an inode
>   * @dentry: Reference to the inode to be unlocked
> + * @o: Private reference for the kernel service
>   *
>   * Drop exclusive access to an inode for a kernel service.  A warning is given
>   * if the inode was not marked for exclusive access.
>   */
> -void inode_excl_inuse_unlock(struct dentry *dentry)
> +void inode_excl_inuse_unlock(struct dentry *dentry, unsigned int o)
>  {
>         if (dentry) {
>                 struct inode *inode = d_inode(dentry);
>
>                 spin_lock(&inode->i_lock);
> -               WARN_ON(!(inode->i_state & I_EXCL_INUSE));
> -               inode->i_state &= ~I_EXCL_INUSE;
> +               if (WARN_ON(!(inode->i_state & I_EXCL_INUSE))) {
> +                       trace_inode_excl_inuse_unlock_bad(inode, o);
> +               } else {
> +                       inode->i_state &= ~I_EXCL_INUSE;
> +                       trace_inode_excl_inuse_unlock(inode, o);
> +               }
>                 spin_unlock(&inode->i_lock);
>         }
>  }
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 5c3361a2dc7c..6434ae11496d 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -224,10 +224,10 @@ static void ovl_free_fs(struct ovl_fs *ofs)
>         dput(ofs->indexdir);
>         dput(ofs->workdir);
>         if (ofs->workdir_locked)
> -               inode_excl_inuse_unlock(ofs->workbasedir);
> +               inode_excl_inuse_unlock(ofs->workbasedir, 0);
>         dput(ofs->workbasedir);
>         if (ofs->upperdir_locked)
> -               inode_excl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root);
> +               inode_excl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root, 0);
>
>         /* Hack!  Reuse ofs->layers as a vfsmount array before freeing it */
>         mounts = (struct vfsmount **) ofs->layers;
> @@ -1239,7 +1239,8 @@ static int ovl_get_upper(struct super_block *sb, struct ovl_fs *ofs,
>         if (upper_mnt->mnt_sb->s_flags & SB_NOSEC)
>                 sb->s_flags |= SB_NOSEC;
>
> -       if (inode_excl_inuse_trylock(ovl_upper_mnt(ofs)->mnt_root)) {
> +       if (inode_excl_inuse_trylock(ovl_upper_mnt(ofs)->mnt_root, 0,
> +                                    inode_excl_inuse_by_overlayfs)) {
>                 ofs->upperdir_locked = true;
>         } else {
>                 err = ovl_report_in_use(ofs, "upperdir");
> @@ -1499,7 +1500,8 @@ static int ovl_get_workdir(struct super_block *sb, struct ovl_fs *ofs,
>
>         ofs->workbasedir = dget(workpath.dentry);
>
> -       if (inode_excl_inuse_trylock(ofs->workbasedir)) {
> +       if (inode_excl_inuse_trylock(ofs->workbasedir, 0,
> +                                    inode_excl_inuse_by_overlayfs)) {

More incentive to keep the ovl_* wrappers.

Thanks,
Amir.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

