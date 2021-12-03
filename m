Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F76467B36
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Dec 2021 17:21:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638548498;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XILJU/x0kI2E4IrsCurWkJ/pyX8ee266OFmvm8gHOkU=;
	b=bdWQv2ndzP3sZtjwrNlNBSG5JEYA87EtXCLyMzaZ1BG2S4ZiGmiMaGwSqHlPhGlrVpOe2t
	a6YO+h/50O9Kpp+y/3IEdiqXPLwUCDKcZfasb8kH8+XGnBEY/9DQRcyXhrcq9MABzeY1vf
	osVosr2JRcRyQNeT4Uj+KDDAXhZMCew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-5__sy6riM7WZ1VLLBiSWrw-1; Fri, 03 Dec 2021 11:21:35 -0500
X-MC-Unique: 5__sy6riM7WZ1VLLBiSWrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48069193F59F;
	Fri,  3 Dec 2021 16:21:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DF584EC37;
	Fri,  3 Dec 2021 16:21:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB96C1809CB8;
	Fri,  3 Dec 2021 16:21:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B3GLR8l005966 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Dec 2021 11:21:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 37AF62026D4D; Fri,  3 Dec 2021 16:21:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 335C32026D46
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 16:21:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 057AD181E076
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 16:21:19 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-586-7IhYyM6VNi2wfP4ej5R-tA-1; Fri, 03 Dec 2021 11:21:17 -0500
X-MC-Unique: 7IhYyM6VNi2wfP4ej5R-tA-1
Received: by mail-qv1-f72.google.com with SMTP id
	e14-20020a0562140d8e00b003bace92a1feso3998447qve.5
	for <linux-cachefs@redhat.com>; Fri, 03 Dec 2021 08:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WmwKI0Rrs6s+p5PMIOByDWLRKuoxB60ntIhXHHr7XFw=;
	b=nEqXCHwMQ/FqHRIV+HSwVfDPe5r89Fr+mNx5dlKdqmrg9ZCXkF+E/7EOy7FvznaTjZ
	ZMlWdJs5eTmQiz/vRPw+I0PiFQF7lm1OGCRRVBISdBezpbQhcPJzhXDS+iDskskd+Tc9
	Mfu2Q06C5Eujh74rEW6wHuXuaf1QDNsZRBOmwG5AFB/YDOhgKG+WFSJgEQU7Hvm9VPSu
	62bjTp4nl0Wccwd2ZNRHobUCiFi5c1LHYxaMtPZxjE9+Hzb05hZDrvTdb9MgYHJs+Y9S
	CB93Oqn7RnsGcoaITPU0wHC80gOvZmUDEI3aQUQk/zdlAMqMG+1K7DO29MoUHMkMnwDu
	LIxQ==
X-Gm-Message-State: AOAM533uHTFfKa4FFBKm/5q7rqwQd1efQ3IFS60Xtnz7k8hVS1gdv0Jf
	PQFHOjvIoRiL/yUvXGTxNf5gMs1YPSpHv2mHn5UX0YfyVU9vIyjHC6IKca84wx9qv0bD9qsA7eL
	ZH8xsbWyMcLxwcPNLteQQqg==
X-Received: by 2002:a37:712:: with SMTP id 18mr18618339qkh.366.1638548476899; 
	Fri, 03 Dec 2021 08:21:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytQeHHjaOvWbjY3ttJKV9uzms29bDNbIS2T0Gm6yNwfaWmDh0HATyYXYPHOuRSyahKw5mlKw==
X-Received: by 2002:a37:712:: with SMTP id 18mr18618322qkh.366.1638548476666; 
	Fri, 03 Dec 2021 08:21:16 -0800 (PST)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	e20sm2692363qty.14.2021.12.03.08.21.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Dec 2021 08:21:16 -0800 (PST)
Message-ID: <88b88564292f84714c83bfe14cae75691e4387c5.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: Shyam Prasad N <nspmangalore@gmail.com>, David Howells
	<dhowells@redhat.com>, Steve French <smfrench@gmail.com>, CIFS
	<linux-cifs@vger.kernel.org>,
	Paulo Alcantara <pc@cjr.nz>, linux-cachefs@redhat.com
Date: Fri, 03 Dec 2021 11:21:15 -0500
In-Reply-To: <CANT5p=qXbQU4g4VX=W9mOQo1SjMxnFGfpkLOJWgCpicyDLvt-w@mail.gmail.com>
References: <CANT5p=qXbQU4g4VX=W9mOQo1SjMxnFGfpkLOJWgCpicyDLvt-w@mail.gmail.com>
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH] cifs: wait for tcon resource_id before
 getting fscache super
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-12-03 at 14:52 +0530, Shyam Prasad N wrote:
> The logic for initializing tcon->resource_id is done inside
> cifs_root_iget. fscache super cookie relies on this for aux
> data. So we need to push the fscache initialization to this
> later point during mount.
> 
> Signed-off-by: Shyam Prasad N <sprasad@microsoft.com>
> ---
>  fs/cifs/connect.c | 6 ------
>  fs/cifs/fscache.c | 2 +-
>  fs/cifs/inode.c   | 7 +++++++
>  3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 6b705026da1a3..eee994b0925ff 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3046,12 +3046,6 @@ static int mount_get_conns(struct mount_ctx *mnt_ctx)
>   cifs_dbg(VFS, "read only mount of RW share\n");
>   /* no need to log a RW mount of a typical RW share */
>   }
> - /*
> - * The cookie is initialized from volume info returned above.
> - * Inside cifs_fscache_get_super_cookie it checks
> - * that we do not get super cookie twice.
> - */
> - cifs_fscache_get_super_cookie(tcon);
>   }
> 
>   /*
> diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
> index 7e409a38a2d7c..f4da693760c11 100644
> --- a/fs/cifs/fscache.c
> +++ b/fs/cifs/fscache.c
> @@ -92,7 +92,7 @@ void cifs_fscache_get_super_cookie(struct cifs_tcon *tcon)
>   * In the future, as we integrate with newer fscache features,
>   * we may want to instead add a check if cookie has changed
>   */
> - if (tcon->fscache == NULL)
> + if (tcon->fscache)
>   return;
> 

Ouch! Does the above mean that fscache on cifs is just plain broken at
the moment? If this is the routine that sets the tcon cookie, then it
looks like it just never gets set?

>   sharename = extract_sharename(tcon->treeName);
> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> index 82848412ad852..96d083db17372 100644
> --- a/fs/cifs/inode.c
> +++ b/fs/cifs/inode.c
> @@ -1376,6 +1376,13 @@ struct inode *cifs_root_iget(struct super_block *sb)
>   inode = ERR_PTR(rc);
>   }
> 
> + /*
> + * The cookie is initialized from volume info returned above.
> + * Inside cifs_fscache_get_super_cookie it checks
> + * that we do not get super cookie twice.
> + */
> + cifs_fscache_get_super_cookie(tcon);
> +
>  out:
>   kfree(path);
>   free_xid(xid);
> 

-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

