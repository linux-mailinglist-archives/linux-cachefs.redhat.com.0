Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F17753223F
	for <lists+linux-cachefs@lfdr.de>; Tue, 24 May 2022 06:45:03 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-rjcWAOE8PGmjAtcMLzdTCQ-1; Tue, 24 May 2022 00:44:59 -0400
X-MC-Unique: rjcWAOE8PGmjAtcMLzdTCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2E42833961;
	Tue, 24 May 2022 04:44:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DCD42026D6A;
	Tue, 24 May 2022 04:44:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B74E81947BA3;
	Tue, 24 May 2022 04:44:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B52E41947068 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 24 May 2022 04:44:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3864B1410DD7; Tue, 24 May 2022 04:44:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 349771410DD5
 for <linux-cachefs@redhat.com>; Tue, 24 May 2022 04:44:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CC183806737
 for <linux-cachefs@redhat.com>; Tue, 24 May 2022 04:44:55 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-lfs969u7OZiqGbg3Tx-0bQ-1; Tue, 24 May 2022 00:44:53 -0400
X-MC-Unique: lfs969u7OZiqGbg3Tx-0bQ-1
Received: by mail-qk1-f170.google.com with SMTP id 14so8178408qkl.6
 for <linux-cachefs@redhat.com>; Mon, 23 May 2022 21:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ji4sol5sENBEUR3FRJaaPGspSAIjqZFEyUSpEFLQDI=;
 b=WYby4JQ9vMFB5yNPcvxEc+TOLaKbXFo+g34QKpe+wKzBSB0BrIZAAEBkqa8NCx7a61
 rA+6QcmDy+hnOs9aKPianZpkcPAgLEFky9NiXCqtyKyU8DoE22fAwVeNPcdCYxCa7lZA
 HR/ZeB/kLAsxbkYfem2EwItYJsoUZcePmGgFYmRLYo5RKXF3G51r1lcJ2j2gJYejnNH2
 Q8zS2JAzCk0XNzVVffr5iip2BB+QBwCTYcN4aMWZDL6ByKRnSHLuqVddL0R976CJCqow
 hFDbic5tGrYnTEDE5SEMQLPAplRnZFsk73JGJ2xUSl3jWcE9zkidlZzvjIHxSPIz6gAL
 VG7A==
X-Gm-Message-State: AOAM532GXrgtNWqCL0mJ8cgwr0dqDVreHJL/Adg2g3+LANyJf61wQeZ4
 NcjzVNghl6XxfFq6DAkudZHE1D/U+azIURJUcn4=
X-Google-Smtp-Source: ABdhPJyrMD7rEPjUOmV37i177VE1l/2iEx6x8NhX1oEETIuR1mmo3FjJT7Pvls+DCaJgQuyMwtU5RxBp/cx5GfJd574=
X-Received: by 2002:a37:8846:0:b0:6a0:f6f1:a015 with SMTP id
 k67-20020a378846000000b006a0f6f1a015mr16143176qkd.386.1653367492354; Mon, 23
 May 2022 21:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220520212746.95075-1-fred@cloudflare.com>
In-Reply-To: <20220520212746.95075-1-fred@cloudflare.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 24 May 2022 07:44:41 +0300
Message-ID: <CAOQ4uxhOZu06xOHbwWszkvprjMVj4ZYbQMpdig0R1WH-4zZGCA@mail.gmail.com>
To: Frederick Lawler <fred@cloudflare.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH] cred: Propagate
 security_prepare_creds() error code
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-aio@kvack.org, Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, selinux@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, kernel-team@cloudflare.com,
 samba-technical <samba-technical@lists.samba.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 LSM List <linux-security-module@vger.kernel.org>, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 21, 2022 at 2:17 PM Frederick Lawler <fred@cloudflare.com> wrote:
>
> While experimenting with the security_prepare_creds() LSM hook, we
> noticed that our EPERM error code was not propagated up the callstack.
> Instead ENOMEM is always returned.  As a result, some tools may send a
> confusing error message to the user:
>
> $ unshare -rU
> unshare: unshare failed: Cannot allocate memory
>
> A user would think that the system didn't have enough memory, when
> instead the action was denied.
>
> This problem occurs because prepare_creds() and prepare_kernel_cred()
> return NULL when security_prepare_creds() returns an error code. Later,
> functions calling prepare_creds() and prepare_kernel_cred() return
> ENOMEM because they assume that a NULL meant there was no memory
> allocated.
>
> Fix this by propagating an error code from security_prepare_creds() up
> the callstack.
>
> Signed-off-by: Frederick Lawler <fred@cloudflare.com>
> ---
[...]
> @@ -1173,7 +1173,7 @@ struct file *filp_open(const char *filename, int flags, umode_t mode)
>  {
>         struct filename *name = getname_kernel(filename);
>         struct file *file = ERR_CAST(name);
> -
> +

stray whitespace

>         if (!IS_ERR(name)) {
>                 file = file_open_name(name, flags, mode);
>                 putname(name);
> diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
> index f18490813170..905eb8f69d64 100644
> --- a/fs/overlayfs/dir.c
> +++ b/fs/overlayfs/dir.c
> @@ -589,28 +589,32 @@ static int ovl_create_or_link(struct dentry *dentry, struct inode *inode,
>                         goto out_revert_creds;
>         }
>
> -       err = -ENOMEM;
>         override_cred = prepare_creds();
> -       if (override_cred) {
> -               override_cred->fsuid = inode->i_uid;
> -               override_cred->fsgid = inode->i_gid;
> -               if (!attr->hardlink) {
> -                       err = security_dentry_create_files_as(dentry,
> -                                       attr->mode, &dentry->d_name, old_cred,
> -                                       override_cred);
> -                       if (err) {
> -                               put_cred(override_cred);
> -                               goto out_revert_creds;
> -                       }
> -               }
> -               put_cred(override_creds(override_cred));
> -               put_cred(override_cred);
> +       if (IS_ERR(override_cred)) {
> +               err = PTR_ERR(override_cred);
> +               goto out_revert_creds;
> +       }
>
> -               if (!ovl_dentry_is_whiteout(dentry))
> -                       err = ovl_create_upper(dentry, inode, attr);
> -               else
> -                       err = ovl_create_over_whiteout(dentry, inode, attr);
> +       override_cred->fsuid = inode->i_uid;
> +       override_cred->fsgid = inode->i_gid;
> +       if (!attr->hardlink) {
> +               err = security_dentry_create_files_as(dentry, attr->mode,
> +                                                     &dentry->d_name,
> +                                                     old_cred,
> +                                                     override_cred);
> +               if (err) {
> +                       put_cred(override_cred);
> +                       goto out_revert_creds;
> +               }
>         }
> +       put_cred(override_creds(override_cred));
> +       put_cred(override_cred);
> +
> +       if (!ovl_dentry_is_whiteout(dentry))
> +               err = ovl_create_upper(dentry, inode, attr);
> +       else
> +               err = ovl_create_over_whiteout(dentry, inode, attr);
> +

It does not look like reducing the nesting level was really needed for
your change. Was it? It is impossible to review a logic change
with this much code churn.
Please stick to the changes you declared you are doing
and leave code style out of it.

>  out_revert_creds:
>         revert_creds(old_cred);
>         return err;
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 001cdbb8f015..b29b62670e10 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1984,10 +1984,11 @@ static int ovl_fill_super(struct super_block *sb, void *data, int silent)
>         if (!ofs)
>                 goto out;
>
> -       err = -ENOMEM;
>         ofs->creator_cred = cred = prepare_creds();
> -       if (!cred)
> +       if (IS_ERR(ofs->creator_cred)) {
> +               err = PTR_ERR(ofs->creator_cred);
>                 goto out_err;
> +       }
>

A non NULL must not be assigned to ofs->creator_cred
use the cred local var for that check, otherwise things will
go badly in ovl_free_fs().

Thanks,
Amir.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

