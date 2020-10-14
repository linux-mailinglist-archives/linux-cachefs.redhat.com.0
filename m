Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1247628E1A5
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Oct 2020 15:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602683370;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OPOtB6+jGM2n/oSSW8h7zduzCJxNCtpgooB1ZwQr3XI=;
	b=NP9W88q9ah8umOGrp+/q4XKcXlStXSoZpuH9S0ri4KCXMbBYU6F8LD8LUnh93/7iJfSRaj
	iXAhf3G71rK0ZrfzHgAHUgF+l2jysfIp+SpbTJq+1Qx3opnB2GroG+zLkCALdcyEC72MdZ
	eh1NihI8UwJIOnAs0x2rpfEx+Ffpn00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-tHlXuJM2P36OFf9CnlGg2g-1; Wed, 14 Oct 2020 09:49:27 -0400
X-MC-Unique: tHlXuJM2P36OFf9CnlGg2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF87018A8251;
	Wed, 14 Oct 2020 13:49:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ABE27666A;
	Wed, 14 Oct 2020 13:49:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1F0318095FF;
	Wed, 14 Oct 2020 13:49:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EDnG8D004102 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 09:49:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A2BD1009A33; Wed, 14 Oct 2020 13:49:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8602C10921BC
	for <linux-cachefs@redhat.com>; Wed, 14 Oct 2020 13:49:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02DDF800161
	for <linux-cachefs@redhat.com>; Wed, 14 Oct 2020 13:49:12 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
	[209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-96-AZV5ltMTP_y4LsFB6xtn8w-1; Wed, 14 Oct 2020 09:49:10 -0400
X-MC-Unique: AZV5ltMTP_y4LsFB6xtn8w-1
Received: by mail-ed1-f72.google.com with SMTP id j6so1230363edh.4
	for <linux-cachefs@redhat.com>; Wed, 14 Oct 2020 06:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oSNs1Z4597yqqSr/izsI9vDVqZKwJUb3kL7SxhQKXlY=;
	b=AHmv/5I0W+I5OuRZflHnYflIvtugHONhN+jNkte6Xe27j9YXlW8wk/1Vduk3ypSfde
	dhmTN6eTD+u6FGAMmEDRK9csbPjw2Jkff6/90M2YtwkSVpxsl3W4SSYV2cLQk0/+RNXD
	8CvL/9RQJX/a1RHT4nQy5mNH5+H6CCQLiLFUzR28r8UushEaCEW636BfMcfj+Sj3aS0q
	glWve5+yFJeUDah9McweWuZ9SyRlmwh1WsLbZgsL812odagJmT5K1E5YTohEclOmELTl
	gvq3BxPb1tF2KLzcIbyQJDIIi+MeibuVCJRCRJEvSQ0a1+LGhFIyTQc90/NqkfjsDDVD
	VQSA==
X-Gm-Message-State: AOAM533Gd+BxzxtHz8pdDi5lIHvsTij1j15m6Ql1yAfEJR0bS7qE0jnv
	KUQvVrYzBF+D95eGvP4jJ7lpYDpGEjXHKqbWnwdMGe450gVjCx7aDU1634xzkKq+uAwLkk7Ib+o
	ssHVP81J/qm1/GoE0/Fk6rhlBFRHaMUMXkJKeZw==
X-Received: by 2002:a17:906:564d:: with SMTP id
	v13mr5671383ejr.217.1602683348562; 
	Wed, 14 Oct 2020 06:49:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuDBNJnuCIVopNCRDD7xc3d1K1H0uj6mOIIcRgMvx/filL7NU3n8TF2yUT5NzNIGDqSlXeB98NLDgx3q7QzdI=
X-Received: by 2002:a17:906:564d:: with SMTP id
	v13mr5671356ejr.217.1602683348286; 
	Wed, 14 Oct 2020 06:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200827142724.15032-1-tiwai@suse.de>
In-Reply-To: <20200827142724.15032-1-tiwai@suse.de>
From: David Wysochanski <dwysocha@redhat.com>
Date: Wed, 14 Oct 2020 09:48:32 -0400
Message-ID: <CALF+zOn5Pzuf1zv1_bR_MbX8oJ5UZ-FpCd8KkkMzWOE9n3p7EQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-cachefs] [PATCH] fs/cachefiles: Drop superfluous
 readpages aops NULL check
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

On Thu, Aug 27, 2020 at 11:10 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> After the recent actions to convert readpages aops to readahead, the
> NULL checks of readpages aops in cachefiles_read_or_alloc_page() may
> hit falsely.  More badly, it's an ASSERT() call, and this panics.
>
> Drop the superfluous NULL checks for fixing this regression.
>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208883
> BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1175245
> Cc: <stable@vger.kernel.org> # v5.8
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  fs/cachefiles/rdwr.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/cachefiles/rdwr.c b/fs/cachefiles/rdwr.c
> index 3080cda9e824..5b4cee71fa32 100644
> --- a/fs/cachefiles/rdwr.c
> +++ b/fs/cachefiles/rdwr.c
> @@ -412,7 +412,6 @@ int cachefiles_read_or_alloc_page(struct fscache_retrieval *op,
>
>         inode = d_backing_inode(object->backer);
>         ASSERT(S_ISREG(inode->i_mode));
> -       ASSERT(inode->i_mapping->a_ops->readpages);
>
>         /* calculate the shift required to use bmap */
>         shift = PAGE_SHIFT - inode->i_sb->s_blocksize_bits;
> @@ -712,7 +711,6 @@ int cachefiles_read_or_alloc_pages(struct fscache_retrieval *op,
>
>         inode = d_backing_inode(object->backer);
>         ASSERT(S_ISREG(inode->i_mode));
> -       ASSERT(inode->i_mapping->a_ops->readpages);
>
>         /* calculate the shift required to use bmap */
>         shift = PAGE_SHIFT - inode->i_sb->s_blocksize_bits;
> --
> 2.16.4
>
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-cachefs
>

Agree this should go in as fscache (I am testing with NFS) becomes
unusable without it after 5.8.

It may have flown under the radar due to the in-progress FS-Cache rewrite.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

