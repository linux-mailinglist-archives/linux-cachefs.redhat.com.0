Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5E046DD04
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Dec 2021 21:27:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638995219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8/+YzKB6sLHqp7U6ejDs2KybhoHn1U/fsxRd6MxxeFs=;
	b=cx6cad39bDjxWLXxQlPQ+DfdU03i7KEQZrGe3w0hDCT0c/Z8lO8AUE/mpVCH+vNuqmnP1g
	cdVoCMsvZuUY1gtH3Hlq7eXwIpV5k47+AY+g//cP4fiQlwJMu6kdv74qc6Uzh5pAKzKAsG
	JisaSe17msot1DKO6OWFVLArihUwZWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-243-z-MF7I8fO7ShNubkaRZ5zQ-1; Wed, 08 Dec 2021 15:26:56 -0500
X-MC-Unique: z-MF7I8fO7ShNubkaRZ5zQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF91818A0F1F;
	Wed,  8 Dec 2021 20:26:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85A0C1009AF8;
	Wed,  8 Dec 2021 20:26:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEA481809CB8;
	Wed,  8 Dec 2021 20:26:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8KQn5W025809 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 15:26:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 35BB75DF4E; Wed,  8 Dec 2021 20:26:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA97518369;
	Wed,  8 Dec 2021 20:26:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1638952658-20285-1-git-send-email-huangzhaoyang@gmail.com>
References: <1638952658-20285-1-git-send-email-huangzhaoyang@gmail.com>
To: Huangzhaoyang <huangzhaoyang@gmail.com>
MIME-Version: 1.0
Date: Wed, 08 Dec 2021 20:26:46 +0000
Message-ID: <2868725.1638995206@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B8KQn5W025809
X-loop: linux-cachefs@redhat.com
Cc: Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: Re: [Linux-cachefs] [PATCH] fs: judging context via
	current_is_kswapd instead of gfp_flag
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
Content-ID: <2868724.1638995206.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Huangzhaoyang <huangzhaoyang@gmail.com> wrote:

[adding linux-cachefs to the cc list]

> Kswapd uses GFP_KERNEL as gfp_flag which make the judgment of
> context is unexpected. fix it by using current_is_kswapd.
> 
> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>  fs/afs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index eb11d04..6c199d5 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -485,7 +485,7 @@ static int afs_releasepage(struct page *page, gfp_t gfp_flags)
>  	 * elected to wait */
>  #ifdef CONFIG_AFS_FSCACHE
>  	if (PageFsCache(page)) {
> -		if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))
> +		if (current_is_kswapd() || !(gfp_flags & __GFP_FS))
>  			return false;
>  		wait_on_page_fscache(page);
>  	}

I have several of these in my fscache-rewrite branch, spread across a number
of filesystems.  Should I fix all of them the same way?

fs/9p/vfs_addr.c:               if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))
fs/afs/file.c:          if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))
fs/nfs/file.c:          if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))
fs/nfs/fscache.h:               if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

