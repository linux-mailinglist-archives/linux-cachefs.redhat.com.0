Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D897D4D50A1
	for <lists+linux-cachefs@lfdr.de>; Thu, 10 Mar 2022 18:34:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646933687;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dOeqCq3wF8Sz0tQlIZj76fW1HZXSPwaTvWtzCRfzaf0=;
	b=OR87JhXC2Xmqr0wivvwmnBFerTYd9zlpeMSypkFZy8/TyvUjE/kdGfxdEMfA0vC6t5Ar9p
	PWdZRnph//Z5azVOutCUhEOUFwVkVMVIzqlXacBOunL/junv2y+KqR7wItD5Mtm4ft5jph
	pZrL4ug6OsaEAVOFILDC5Qkpsxdp7Y4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-blEgIC6IOv-2S_0HaFnqFw-1; Thu, 10 Mar 2022 12:34:43 -0500
X-MC-Unique: blEgIC6IOv-2S_0HaFnqFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFE6D3820541;
	Thu, 10 Mar 2022 17:34:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB051C15E6F;
	Thu, 10 Mar 2022 17:34:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A1792194E017;
	Thu, 10 Mar 2022 17:34:39 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1B41019452D2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 10 Mar 2022 17:34:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0984E434857; Thu, 10 Mar 2022 17:34:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0580543484E
 for <linux-cachefs@redhat.com>; Thu, 10 Mar 2022 17:34:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C2A3C01C21
 for <linux-cachefs@redhat.com>; Thu, 10 Mar 2022 17:34:38 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-xBqOBSJyNOe-ruCkir2OhA-1; Thu, 10 Mar 2022 12:34:37 -0500
X-MC-Unique: xBqOBSJyNOe-ruCkir2OhA-1
Received: by mail-qk1-f198.google.com with SMTP id
 b133-20020a37678b000000b0067d24942b91so4330163qkc.12
 for <linux-cachefs@redhat.com>; Thu, 10 Mar 2022 09:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=+sI8yl68F8AaSxc5/19rLFgsuz0y8nt6Rj/YSh3VHaE=;
 b=cNp6MTJs18PKuVr2U13sr/Ew/krZH/LHidJuVWybDgSJjVMt1BFH2MsWjk2zQGg8o1
 LQLQ8uFJSx1g92HrB2InGQMqaGM9tosOBgEwMgS79N2eGEeManusFSxVqoc7WbZo5lx9
 i5Gs3XYw19Yc8uXsMkt1vgoSsdXPpQLEHzLoePBrdJJcYILPV7IkQSoNlXJpu8kD0cfB
 Wmw+vFN12TjUi09xGQhqym/9c2bZKaE4PBMCmum9ZBuXAAqcxflT4J7vCbl8mDHqaG0W
 YMI7KQCp9osb7wKnlmzSjiNdaLOeqkTBfidM5AR4N490JlSPj7INVkmU16pLg144vfEI
 6N4g==
X-Gm-Message-State: AOAM5314kFpFIHmZoIg8FrbXB4Xv5bVpc5WsZVMKARwdKcGEyDGlV1Tc
 HiCoyBc4IuQm++uxa5a+h8nIMsthLp3FNqBhqcPYP7z7RiCE8Gu4RhC6AKdASLocg08LRzyPZuV
 LIgL5akrICpC5KJm3PSk+KQ==
X-Received: by 2002:ac8:5f84:0:b0:2e0:6965:c999 with SMTP id
 j4-20020ac85f84000000b002e06965c999mr4925470qta.477.1646933676599; 
 Thu, 10 Mar 2022 09:34:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzM49ZVae3bPgm0svuUu3uf+AJzp4pMchlkgmKNd23/D20Xgvy0iFYR1hc8U1liK5jF6Izwyg==
X-Received: by 2002:ac8:5f84:0:b0:2e0:6965:c999 with SMTP id
 j4-20020ac85f84000000b002e06965c999mr4925451qta.477.1646933676349; 
 Thu, 10 Mar 2022 09:34:36 -0800 (PST)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
 [68.20.15.154]) by smtp.gmail.com with ESMTPSA id
 t28-20020a05620a005c00b00662fb1899d2sm2562187qkt.0.2022.03.10.09.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 09:34:35 -0800 (PST)
Message-ID: <dd054c962818716e718bd9b446ee5322ca097675.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Thu, 10 Mar 2022 12:34:34 -0500
In-Reply-To: <164692907694.2099075.10081819855690054094.stgit@warthog.procyon.org.uk>
References: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
 <164692907694.2099075.10081819855690054094.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v3 12/20] ceph: Make ceph_init_request()
 check caps on readahead
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2022-03-10 at 16:17 +0000, David Howells wrote:
> Move the caps check from ceph_readahead() to ceph_init_request(),
> conditional on the origin being NETFS_READAHEAD so that in a future patch,
> ceph can point its ->readahead() vector directly at netfs_readahead().
> 
> Changes
> =======
> ver #3)
>  - Split from the patch to add a netfs inode context[1].
>  - Need to store the caps got in rreq->netfs_priv for later freeing.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: ceph-devel@vger.kernel.org
> cc: linux-cachefs@redhat.com
> Link: https://lore.kernel.org/r/8af0d47f17d89c06bbf602496dd845f2b0bf25b3.camel@kernel.org/ [1]
> ---
> 
>  fs/ceph/addr.c |   69 +++++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 41 insertions(+), 28 deletions(-)
> 
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 9189257476f8..6d056db41f50 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -354,6 +354,45 @@ static void ceph_netfs_issue_read(struct netfs_io_subrequest *subreq)
>  	dout("%s: result %d\n", __func__, err);
>  }
>  
> +static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
> +{
> +	struct inode *inode = rreq->inode;
> +	int got = 0, want = CEPH_CAP_FILE_CACHE;
> +	int ret = 0;
> +
> +	if (file) {
> +		struct ceph_rw_context *rw_ctx;
> +		struct ceph_file_info *fi = file->private_data;
> +
> +		rw_ctx = ceph_find_rw_context(fi);
> +		if (rw_ctx)
> +			return 0;
> +	}
> +
> +	if (rreq->origin != NETFS_READAHEAD)
> +		return 0;
> +

^^^
I think you should move this check above the if (file) block above it.
We don't need to anything at all if we're not in readahead.

> +	/*
> +	 * readahead callers do not necessarily hold Fcb caps
> +	 * (e.g. fadvise, madvise).
> +	 */
> +	ret = ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want, true, &got);
> +	if (ret < 0) {
> +		dout("start_read %p, error getting cap\n", inode);
> +		return ret;
> +	}
> +
> +	if (!(got & want)) {
> +		dout("start_read %p, no cache cap\n", inode);
> +		return -EACCES;
> +	}
> +	if (ret == 0)
> +		return -EACCES;
> +
> +	rreq->netfs_priv = (void *)(uintptr_t)got;
> +	return 0;
> +}
> +
>  static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>  {
>  	struct inode *inode = mapping->host;
> @@ -365,7 +404,7 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>  }
>  
>  static const struct netfs_request_ops ceph_netfs_read_ops = {
> -	.is_cache_enabled	= ceph_is_cache_enabled,
> +	.init_request		= ceph_init_request,
>  	.begin_cache_operation	= ceph_begin_cache_operation,
>  	.issue_read		= ceph_netfs_issue_read,
>  	.expand_readahead	= ceph_netfs_expand_readahead,
> @@ -393,33 +432,7 @@ static int ceph_readpage(struct file *file, struct page *subpage)
>  
>  static void ceph_readahead(struct readahead_control *ractl)
>  {
> -	struct inode *inode = file_inode(ractl->file);
> -	struct ceph_file_info *fi = ractl->file->private_data;
> -	struct ceph_rw_context *rw_ctx;
> -	int got = 0;
> -	int ret = 0;
> -
> -	if (ceph_inode(inode)->i_inline_version != CEPH_INLINE_NONE)
> -		return;
> -
> -	rw_ctx = ceph_find_rw_context(fi);
> -	if (!rw_ctx) {
> -		/*
> -		 * readahead callers do not necessarily hold Fcb caps
> -		 * (e.g. fadvise, madvise).
> -		 */
> -		int want = CEPH_CAP_FILE_CACHE;
> -
> -		ret = ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want, true, &got);
> -		if (ret < 0)
> -			dout("start_read %p, error getting cap\n", inode);
> -		else if (!(got & want))
> -			dout("start_read %p, no cache cap\n", inode);
> -
> -		if (ret <= 0)
> -			return;
> -	}
> -	netfs_readahead(ractl, &ceph_netfs_read_ops, (void *)(uintptr_t)got);
> +	netfs_readahead(ractl, &ceph_netfs_read_ops, NULL);
>  }
>  
>  #ifdef CONFIG_CEPH_FSCACHE
> 
> 

-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

