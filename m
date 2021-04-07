Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9B62F3569B2
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 12:30:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-6Hwf8EtBP_mYIZBfodlb_g-1; Wed, 07 Apr 2021 06:30:46 -0400
X-MC-Unique: 6Hwf8EtBP_mYIZBfodlb_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 327AB107ACE4;
	Wed,  7 Apr 2021 10:30:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E95F5B4BF;
	Wed,  7 Apr 2021 10:30:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 978E25533E;
	Wed,  7 Apr 2021 10:30:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 137AUaHV032209 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 06:30:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 143622157F27; Wed,  7 Apr 2021 10:30:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E6812157F24
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 10:30:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61033811E93
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 10:30:33 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-193-6SmNEGsiMHO-twdMll7tiQ-1; Wed, 07 Apr 2021 06:30:31 -0400
X-MC-Unique: 6SmNEGsiMHO-twdMll7tiQ-1
Received: by mail-il1-f170.google.com with SMTP id d2so15715806ilm.10;
	Wed, 07 Apr 2021 03:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Mve0RiIdmT95tyXWmJ7dRzQXxzh2mzMYhh6+hE97H3s=;
	b=ogfo1YIrOi7rfbsF1dhPfWOWYTzH7P4jA01/tS7NKaDBAIVpKXBVsIAXO0ARsG2UpU
	OA11RV4JkzLrY1yNO4Swqc2lrpKeuOOGbcTS6r2+geC2QZIfc+zbcSXQi2OiBLA5oll6
	WjD7bNO+Ncoanr4/JHd6m3ya+fX1cqurUVNIVMdGOVXgKd068lJbfZWwe8/pSZsPlKCj
	wqutfI0NB9zz+m4IxaNPr5D9pQ2rjb1tglXV3ahALpo09R1nNyWM8uprKXChDunjlILQ
	DTvY91EOJhTwsu91SZELc0+KDVwkdHCy1nT1TZ0Qlc7cdfq3/25iWvC7/3YJnMJGYFzb
	V7QA==
X-Gm-Message-State: AOAM530DN8jNrWw/WO0yRc47+1vAyLFWuisa8mZ52DXPeeV+2zXLLKgi
	yQjQD8s/hSHKbkNFJk06YloAmQluuQaQWzGh6/I=
X-Google-Smtp-Source: ABdhPJxCYn4dJ2OBz/UUqG0CNWn1X/X8ExgfGF5CfPFdBLY5eFd/iwwfRzgmqpl5MJz8qceShD5xrRXAC/gcGXYgDsk=
X-Received: by 2002:a92:2c08:: with SMTP id t8mr2202549ile.72.1617791430937;
	Wed, 07 Apr 2021 03:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210407090208.876920-1-brauner@kernel.org>
	<20210407090208.876920-2-brauner@kernel.org>
In-Reply-To: <20210407090208.876920-2-brauner@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 7 Apr 2021 13:30:19 +0300
Message-ID: <CAOQ4uxijmfgbYiZ231ndRYKyrYOcgqQAz4wqZeRje7-Had22fw@mail.gmail.com>
To: Christian Brauner <brauner@kernel.org>
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
Cc: Miklos Szeredi <miklos@szeredi.hu>, Tyler Hicks <code@tyhicks.com>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [Linux-cachefs] [PATCH v2 2/2] cachefiles: extend ro check to
	private mount
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

On Wed, Apr 7, 2021 at 12:02 PM Christian Brauner <brauner@kernel.org> wrote:
>
> From: Christian Brauner <christian.brauner@ubuntu.com>
>
> So far cachefiles only verified that the superblock wasn't read-only but
> didn't check whether the mount was. This made sense when we did not use
> a private mount because the read-only state could change at any point.
>
> Now that we have a private mount and mount properties can't change
> behind our back extend the read-only check to include the vfsmount.
>
> The __mnt_is_readonly() helper will check both the mount and the
> superblock.  Note that before we checked root->d_sb and now we check
> mnt->mnt_sb but since we have a matching <vfsmount, dentry> pair here
> this is only syntactical change, not a semantic one.
>
> Here's how this works:
>
> mount -o ro --bind /var/cache/fscache/ /var/cache/fscache/
>
> systemctl start cachefilesd
>   Job for cachefilesd.service failed because the control process exited with error code.
>   See "systemctl status cachefilesd.service" and "journalctl -xe" for details.
>
> dmesg | grep CacheFiles
>   [    2.922514] CacheFiles: Loaded
>   [  272.206907] CacheFiles: Failed to register: -30
>
> errno 30
>   EROFS 30 Read-only file system
>
> Cc: David Howells <dhowells@redhat.com>
> Cc: linux-cachefs@redhat.com
> Cc: linux-fsdevel@vger.kernel.org
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> ---
> /* v2 */
> patch introduced
> ---
>  fs/cachefiles/bind.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
> index bbace3e51f52..cb8dd9ecc090 100644
> --- a/fs/cachefiles/bind.c
> +++ b/fs/cachefiles/bind.c
> @@ -141,8 +141,13 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
>             !root->d_sb->s_op->sync_fs)
>                 goto error_unsupported;
>
> +       /*
> +        * Verify our mount and superblock aren't read-only.
> +        * Note, while our private mount is guaranteed to not change anymore
> +        * the superblock may still go read-only later.
> +        */
>         ret = -EROFS;
> -       if (sb_rdonly(root->d_sb))
> +       if (__mnt_is_readonly(cache->mnt))
>                 goto error_unsupported;
>

I suppose ovl_get_upper() and ecryptfs_mount() could use a similar fix?
I can post the ovl fix myself.

Thanks,
Amir.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

