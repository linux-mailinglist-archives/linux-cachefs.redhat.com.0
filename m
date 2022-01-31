Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB364A4A8E
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 16:30:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-UIoj52kOPvGOb8XozeiLvA-1; Mon, 31 Jan 2022 10:30:23 -0500
X-MC-Unique: UIoj52kOPvGOb8XozeiLvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 679E485EE79;
	Mon, 31 Jan 2022 15:30:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 474B970D3D;
	Mon, 31 Jan 2022 15:30:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEFB61809CB8;
	Mon, 31 Jan 2022 15:30:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VFUI8F008245 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 10:30:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 23B9953B3; Mon, 31 Jan 2022 15:30:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC8853D0
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 15:30:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C742B1C04B46
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 15:30:14 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-287-dk6lxZTTMtGgpklvF8J9UA-1; Mon, 31 Jan 2022 10:30:10 -0500
X-MC-Unique: dk6lxZTTMtGgpklvF8J9UA-1
Received: by mail-io1-f51.google.com with SMTP id r144so17310725iod.9;
	Mon, 31 Jan 2022 07:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U4lOxvM23ZmbnldrQg7JNgiPtEWkNzkH0ubdj3bkXvY=;
	b=Wm4CvghD/r+qjWmQCdQ1OSDgwfEmpSJF0qju4DSfdZGWM9g1gPYHIE3AWHGYgC7Dc3
	s9au9a6i2U9e1R8I10ieS+3QtZC+BtJAmZ9/Tp21HlBzyJ0fZKbTVt5aQlUD3E6p+Dko
	zBkIgRwXKTiozaQxlh6pjDuYkc6TqSeQqMLreLZPgBIwdO+TgW583u3SpHIjKNi8pnmD
	LldAayJlx11yMPu2dCU0x9gCTvIdsYg4ZthfwJ6gAfdk8TQY8Azr1xNURhxHzGE7nOte
	9Koy0w0bhd4f6OqvStHUptQyVZC99I+oAuxIUSpJxQY3jOvat3fy18UfdW8sj137MCHz
	FZTg==
X-Gm-Message-State: AOAM532pFR6jXJxCC7ySwFYHt+SHxU12ryBJ/Ak8elJwwN0R08zcZ/Lx
	bcFRkfpx5pLQ6ksItRFzXDHO+EdWmRjCHLtTQCJZgxcd
X-Google-Smtp-Source: ABdhPJxwibO2gO9CMmscDSoKmWbxvhWsb65y55IAyx1imtlPY+YM8ipVYN8hNLp+qpbVRoF6slntKqFUan5Y2LZjUgg=
X-Received: by 2002:a05:6638:22cf:: with SMTP id
	j15mr1415760jat.188.1643643009809; 
	Mon, 31 Jan 2022 07:30:09 -0800 (PST)
MIME-Version: 1.0
References: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
	<164364197646.1476539.3635698398603811895.stgit@warthog.procyon.org.uk>
In-Reply-To: <164364197646.1476539.3635698398603811895.stgit@warthog.procyon.org.uk>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Jan 2022 17:29:58 +0200
Message-ID: <CAOQ4uxiorvXhhJbCsGo-B7aBX0BbSYp7wUHmYS1e1xxJ4dpF3w@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Linux-cachefs] [PATCH 1/5] vfs, overlayfs,
 cachefiles: Turn I_OVL_INUSE into something generic
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 31, 2022 at 5:13 PM David Howells <dhowells@redhat.com> wrote:
>
> Turn overlayfs's I_OVL_INUSE into something generic that cachefiles can
> also use for excluding access to its own cache files by renaming it to
> I_EXCL_INUSE as suggested by Amir[1] and hoisting the helpers to generic
> code.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Amir Goldstein <amir73il@gmail.com>
> cc: Miklos Szeredi <miklos@szeredi.hu>
> cc: linux-unionfs@vger.kernel.org
> cc: linux-cachefs@redhat.com
> Link: https://lore.kernel.org/r/CAOQ4uxhRS3MGEnCUDcsB1RL0d1Oy0g0Rzm75hVFAJw2dJ7uKSA@mail.gmail.com/ [1]
> ---
>
>  fs/inode.c               |   43 +++++++++++++++++++++++++++++++++++++++++++
>  fs/overlayfs/overlayfs.h |    3 ---
>  fs/overlayfs/super.c     |   12 ++++++------
>  fs/overlayfs/util.c      |   43 -------------------------------------------
>  include/linux/fs.h       |   22 +++++++++++++++++++---
>  5 files changed, 68 insertions(+), 55 deletions(-)
>
> diff --git a/fs/inode.c b/fs/inode.c
> index 63324df6fa27..954719f66113 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2405,3 +2405,46 @@ struct timespec64 current_time(struct inode *inode)
>         return timestamp_truncate(now, inode);
>  }
>  EXPORT_SYMBOL(current_time);
> +
> +/**
> + * inode_excl_inuse_trylock - Try to exclusively lock an inode for kernel access
> + * @dentry: Reference to the inode to be locked
> + *
> + * Try to gain exclusive access to an inode for a kernel service, returning
> + * true if successful.
> + */
> +bool inode_excl_inuse_trylock(struct dentry *dentry)
> +{
> +       struct inode *inode = d_inode(dentry);
> +       bool locked = false;
> +
> +       spin_lock(&inode->i_lock);
> +       if (!(inode->i_state & I_EXCL_INUSE)) {
> +               inode->i_state |= I_EXCL_INUSE;
> +               locked = true;
> +       }
> +       spin_unlock(&inode->i_lock);
> +
> +       return locked;
> +}
> +EXPORT_SYMBOL(inode_excl_inuse_trylock);
> +
> +/**
> + * inode_excl_inuse_unlock - Unlock exclusive kernel access to an inode
> + * @dentry: Reference to the inode to be unlocked
> + *
> + * Drop exclusive access to an inode for a kernel service.  A warning is given
> + * if the inode was not marked for exclusive access.
> + */
> +void inode_excl_inuse_unlock(struct dentry *dentry)
> +{
> +       if (dentry) {
> +               struct inode *inode = d_inode(dentry);
> +
> +               spin_lock(&inode->i_lock);
> +               WARN_ON(!(inode->i_state & I_EXCL_INUSE));
> +               inode->i_state &= ~I_EXCL_INUSE;
> +               spin_unlock(&inode->i_lock);
> +       }
> +}
> +EXPORT_SYMBOL(inode_excl_inuse_unlock);
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index 2cd5741c873b..8415c0c6d40c 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -337,9 +337,6 @@ int ovl_check_setxattr(struct ovl_fs *ofs, struct dentry *upperdentry,
>                        enum ovl_xattr ox, const void *value, size_t size,
>                        int xerr);
>  int ovl_set_impure(struct dentry *dentry, struct dentry *upperdentry);
> -bool ovl_inuse_trylock(struct dentry *dentry);
> -void ovl_inuse_unlock(struct dentry *dentry);
> -bool ovl_is_inuse(struct dentry *dentry);
>  bool ovl_need_index(struct dentry *dentry);
>  int ovl_nlink_start(struct dentry *dentry);
>  void ovl_nlink_end(struct dentry *dentry);
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 7bb0a47cb615..5c3361a2dc7c 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -224,10 +224,10 @@ static void ovl_free_fs(struct ovl_fs *ofs)
>         dput(ofs->indexdir);
>         dput(ofs->workdir);
>         if (ofs->workdir_locked)
> -               ovl_inuse_unlock(ofs->workbasedir);
> +               inode_excl_inuse_unlock(ofs->workbasedir);
>         dput(ofs->workbasedir);
>         if (ofs->upperdir_locked)
> -               ovl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root);
> +               inode_excl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root);
>
>         /* Hack!  Reuse ofs->layers as a vfsmount array before freeing it */
>         mounts = (struct vfsmount **) ofs->layers;
> @@ -1239,7 +1239,7 @@ static int ovl_get_upper(struct super_block *sb, struct ovl_fs *ofs,
>         if (upper_mnt->mnt_sb->s_flags & SB_NOSEC)
>                 sb->s_flags |= SB_NOSEC;
>
> -       if (ovl_inuse_trylock(ovl_upper_mnt(ofs)->mnt_root)) {
> +       if (inode_excl_inuse_trylock(ovl_upper_mnt(ofs)->mnt_root)) {
>                 ofs->upperdir_locked = true;
>         } else {
>                 err = ovl_report_in_use(ofs, "upperdir");
> @@ -1499,7 +1499,7 @@ static int ovl_get_workdir(struct super_block *sb, struct ovl_fs *ofs,
>
>         ofs->workbasedir = dget(workpath.dentry);
>
> -       if (ovl_inuse_trylock(ofs->workbasedir)) {
> +       if (inode_excl_inuse_trylock(ofs->workbasedir)) {
>                 ofs->workdir_locked = true;
>         } else {
>                 err = ovl_report_in_use(ofs, "workdir");
> @@ -1722,7 +1722,7 @@ static int ovl_get_layers(struct super_block *sb, struct ovl_fs *ofs,
>                 if (err)
>                         goto out;
>
> -               if (ovl_is_inuse(stack[i].dentry)) {
> +               if (inode_is_excl_inuse(stack[i].dentry)) {
>                         err = ovl_report_in_use(ofs, "lowerdir");
>                         if (err) {
>                                 iput(trap);
> @@ -1872,7 +1872,7 @@ static int ovl_check_layer(struct super_block *sb, struct ovl_fs *ofs,
>                 if (is_lower && ovl_lookup_trap_inode(sb, parent)) {
>                         err = -ELOOP;
>                         pr_err("overlapping %s path\n", name);
> -               } else if (ovl_is_inuse(parent)) {
> +               } else if (inode_is_excl_inuse(parent)) {
>                         err = ovl_report_in_use(ofs, name);
>                 }
>                 next = parent;
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index f48284a2a896..748c4b22deb3 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -724,49 +724,6 @@ int ovl_set_protattr(struct inode *inode, struct dentry *upper,
>         return 0;
>  }
>
> -/**
> - * Caller must hold a reference to inode to prevent it from being freed while
> - * it is marked inuse.
> - */
> -bool ovl_inuse_trylock(struct dentry *dentry)
> -{
> -       struct inode *inode = d_inode(dentry);
> -       bool locked = false;
> -
> -       spin_lock(&inode->i_lock);
> -       if (!(inode->i_state & I_OVL_INUSE)) {
> -               inode->i_state |= I_OVL_INUSE;
> -               locked = true;
> -       }
> -       spin_unlock(&inode->i_lock);
> -
> -       return locked;
> -}
> -
> -void ovl_inuse_unlock(struct dentry *dentry)
> -{
> -       if (dentry) {
> -               struct inode *inode = d_inode(dentry);
> -
> -               spin_lock(&inode->i_lock);
> -               WARN_ON(!(inode->i_state & I_OVL_INUSE));
> -               inode->i_state &= ~I_OVL_INUSE;
> -               spin_unlock(&inode->i_lock);
> -       }
> -}
> -
> -bool ovl_is_inuse(struct dentry *dentry)
> -{
> -       struct inode *inode = d_inode(dentry);
> -       bool inuse;
> -
> -       spin_lock(&inode->i_lock);
> -       inuse = (inode->i_state & I_OVL_INUSE);
> -       spin_unlock(&inode->i_lock);
> -
> -       return inuse;
> -}

Please leave ovl_* as wrappers instead of changing super.c.

Thanks,
Amir.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

