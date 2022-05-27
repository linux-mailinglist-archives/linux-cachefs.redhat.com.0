Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 073AC5367E3
	for <lists+linux-cachefs@lfdr.de>; Fri, 27 May 2022 22:06:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-zaWmClq4NEGwPS3ID4d09g-1; Fri, 27 May 2022 16:06:45 -0400
X-MC-Unique: zaWmClq4NEGwPS3ID4d09g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5EC3858EFE;
	Fri, 27 May 2022 20:06:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71427112131B;
	Fri, 27 May 2022 20:06:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DC3619466DF;
	Fri, 27 May 2022 20:06:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F3A4B1947065 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 27 May 2022 20:05:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C34A492CA2; Fri, 27 May 2022 20:05:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26BC7492C3B
 for <linux-cachefs@redhat.com>; Fri, 27 May 2022 20:05:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EB32185A7B2
 for <linux-cachefs@redhat.com>; Fri, 27 May 2022 20:05:41 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-wB1jMfvRPNK8UvufufAutg-1; Fri, 27 May 2022 16:05:39 -0400
X-MC-Unique: wB1jMfvRPNK8UvufufAutg-1
Received: by mail-wm1-f48.google.com with SMTP id
 129-20020a1c0287000000b003974edd7c56so1797834wmc.2
 for <linux-cachefs@redhat.com>; Fri, 27 May 2022 13:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hDs5pMehEzS9JtBcciO3du/140ZEedg4Xg+u6dsQZw=;
 b=YDzmXdBsmhkqZhFhzZpAVQIY/d4qW+gscbIAmmKmE825xUJrO6DGnJT7Xc0BTbypGu
 b+rpUk9JY6LeGc3sUSQ6hzgft8Mj+fvR7fIgb5c3aBhtpYoOWRABd9vyzc6YJ2+JF5PS
 qg4GdcRcTlBYotNTY1RBIS4o+YUazisT96VoL9qoWwaVZ2VwWk8bDUY/Xlh0k37Ti8kr
 E7aV5JEzv0vapEJ0gR6VJy+YhFapcHPeoyrCtBHLK7dqDQMy2yInAx9RRmci9HGQdN0a
 /308oPp6mbVn5xAKfcLVGS3L7P8GyoXbTf1lK10d+LylohwsMdHEvg+nhgTJUFk6Knyy
 dKAQ==
X-Gm-Message-State: AOAM533Lr0rGUaTF4PxMYYBNBwosRpGCnU9Pb2R2tfDx/9t8W05CBtLU
 kJs194wDkRR5JNX6qzj1KIlM/Ji5SiLXAVOxFN6u
X-Google-Smtp-Source: ABdhPJzSQiwbwdo8FqZ111McYTLFv4bwIxxTTbHCjxtpHRnG+P00gPgVzRWa/5Bdb55lusFwlbu3a5oOnOFQ3+tgAU8=
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id
 m5-20020a05600c3b0500b0039754ce0896mr8458182wms.3.1653681937794; Fri, 27 May
 2022 13:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220525183703.466936-1-fred@cloudflare.com>
In-Reply-To: <20220525183703.466936-1-fred@cloudflare.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 May 2022 16:05:26 -0400
Message-ID: <CAHC9VhS=_RvB66J9D5AZ+XnyDKupvTQpFzni2uvz348REPUT5A@mail.gmail.com>
To: Frederick Lawler <fred@cloudflare.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v2] cred: Propagate
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, amir73il@gmail.com,
 linux-cifs@vger.kernel.org, selinux@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-cachefs@redhat.com, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, kernel-team@cloudflare.com, serge@hallyn.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 25, 2022 at 2:37 PM Frederick Lawler <fred@cloudflare.com> wrote:
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
>
> ---
> Changes since v1:
> - Revert style churn in ovl_create_or_link() noted by Amir
> - Revert style churn in prepare_nsset() noted by Serge
> - Update documentation for prepare_creds()
> - Set ofs->creator_cred in ovl_fill_super() and req->creds in aio_fsync()
>   to NULL on error noted by Amir
> ---
>  Documentation/security/credentials.rst |  6 +++---
>  fs/aio.c                               |  9 +++++++--
>  fs/cachefiles/security.c               |  8 ++++----
>  fs/cifs/cifs_spnego.c                  |  4 ++--
>  fs/cifs/cifsacl.c                      |  4 ++--
>  fs/coredump.c                          |  2 +-
>  fs/exec.c                              | 14 ++++++++-----
>  fs/ksmbd/smb_common.c                  |  4 ++--
>  fs/nfs/flexfilelayout/flexfilelayout.c |  7 +++++--
>  fs/nfs/nfs4idmap.c                     |  4 ++--
>  fs/nfsd/auth.c                         |  4 ++--
>  fs/nfsd/nfs4callback.c                 | 10 ++++-----
>  fs/nfsd/nfs4recover.c                  |  4 ++--
>  fs/nfsd/nfsfh.c                        |  4 ++--
>  fs/open.c                              |  8 ++++----
>  fs/overlayfs/dir.c                     |  6 ++++--
>  fs/overlayfs/super.c                   |  6 ++++--
>  kernel/capability.c                    |  4 ++--
>  kernel/cred.c                          | 28 +++++++++++++++-----------
>  kernel/groups.c                        |  4 ++--
>  kernel/nsproxy.c                       |  9 ++++++++-
>  kernel/sys.c                           | 28 +++++++++++++-------------
>  kernel/trace/trace_events_user.c       |  4 ++--
>  kernel/umh.c                           |  5 +++--
>  kernel/user_namespace.c                |  6 ++++--
>  net/dns_resolver/dns_key.c             |  4 ++--
>  security/apparmor/task.c               | 12 +++++------
>  security/commoncap.c                   | 20 +++++++++---------
>  security/keys/keyctl.c                 |  8 ++++----
>  security/keys/process_keys.c           | 16 +++++++--------
>  security/landlock/syscalls.c           |  4 ++--
>  security/selinux/hooks.c               |  8 ++++----
>  security/smack/smack_lsm.c             |  8 ++++----
>  security/smack/smackfs.c               |  4 ++--
>  34 files changed, 153 insertions(+), 123 deletions(-)

The SELinux bits look fine to me.

Acked-by: Paul Moore <paul@paul-moore.com> (SELinux)

-- 
paul-moore.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

