Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 038A3233887
	for <lists+linux-cachefs@lfdr.de>; Thu, 30 Jul 2020 20:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596134356;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P243/jBtvi+OGEdEmSCzccSQwJdphkxvbuvTAqo23B4=;
	b=R5fg+N1oqzwdXYTTWjY2APA4t5frF23VWOgXdoQ9W2qCM2bQjyS+pDtbrBlvlafCxUI+d0
	fJfvQq78NVONiEhGWWPOeRj0uWMss6sZ5LdGTZXwFlsOH4MYSDZrxhb/9QMzRdpNLjxJ7f
	hVm+YL2vxY/p9eOVIupNa9MEcNXLeNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-ko3jRxYKNVu9yyJiOXviog-1; Thu, 30 Jul 2020 14:39:13 -0400
X-MC-Unique: ko3jRxYKNVu9yyJiOXviog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08CEC80BCB4;
	Thu, 30 Jul 2020 18:39:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26DAF8A18A;
	Thu, 30 Jul 2020 18:39:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D54C1809554;
	Thu, 30 Jul 2020 18:39:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UId7em024231 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 14:39:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C55D2026D69; Thu, 30 Jul 2020 18:39:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FA7B202B16E
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 18:39:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7151857FAE
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 18:39:04 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-20-UZd9h5PyNhWX24Q3aQmA9Q-1; Thu, 30 Jul 2020 14:39:03 -0400
X-MC-Unique: UZd9h5PyNhWX24Q3aQmA9Q-1
Received: by mail-qk1-f199.google.com with SMTP id a130so18285339qkg.9
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 11:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bC63TVgc/Qu3+3GWEkVlIf/23VH1H3WmghGbbFToBz8=;
	b=Em1YY/aokegsqVZQ5SOSmpBJqDRcopg0SuNjG8Ej+KS08P09YyOhC8gTPWryLJWDTz
	Vf/UVf4dXio0MC5Wv7IDe17DjYwBM8LIwf5fQowgAgUIOOXPqC5bWuOHQ0OqzTXmAYQh
	vJzQYvMR1QjgXdoNT4XKO/UifGyvNmohR1bf7TdXi1KbxDCJkfL71p9L4e508Gyu/cxA
	6ufdncSMRQflK67yscsRWGWy5Q77Jjfh4vCTwacTIJkIsS7FOIFVjfUazLbEyWbq+i0A
	0cZHJ7v5EFgWiHoTc1TO2bgtIW2VXGiGlCjMobxdSlWtNggyygK3LYNLg0LhlUc6x7MJ
	Zw4Q==
X-Gm-Message-State: AOAM532Lw7IFFW+9ZW4F/xo1tjXHpgpkgYwcYlRnbByU9vpv5oXR7OlH
	ovoKeC8HUiOUZmo4irpUdLXfOn0mhpN2dWDRC2S1TRT9AnKTM63BPtOUv7+qmgEGc13r+Tukxl2
	gmzKlBq0zss2y+5gKOllJ8Q==
X-Received: by 2002:ac8:4248:: with SMTP id r8mr41920qtm.218.1596134342778;
	Thu, 30 Jul 2020 11:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6PeiwQqkUEEnLdLCKeP0MSGaMW8G2D4oq644FeFVF6w6wOFBFxARtOS+vQffEypNOsNe87w==
X-Received: by 2002:ac8:4248:: with SMTP id r8mr41901qtm.218.1596134342573;
	Thu, 30 Jul 2020 11:39:02 -0700 (PDT)
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
	by smtp.gmail.com with ESMTPSA id 94sm5291212qtc.88.2020.07.30.11.39.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Jul 2020 11:39:02 -0700 (PDT)
Message-ID: <43e8a8ff1ea015bb7bd335d5616268d36155327a.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: Dave Wysochanski <dwysocha@redhat.com>, Trond Myklebust
	<trondmy@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>
Date: Thu, 30 Jul 2020 14:39:01 -0400
In-Reply-To: <1596031949-26793-14-git-send-email-dwysocha@redhat.com>
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
	<1596031949-26793-14-git-send-email-dwysocha@redhat.com>
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [RFC PATCH v2 13/14] NFS: Call
 fscache_resize_cookie() when inode size changes due to setattr
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-29 at 10:12 -0400, Dave Wysochanski wrote:
> Handle truncate / setattr when fscache is enabled by calling
> fscache_resize_cookie().
> 
> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> ---
>  fs/nfs/inode.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> index 45067303348c..6b814246d07d 100644
> --- a/fs/nfs/inode.c
> +++ b/fs/nfs/inode.c
> @@ -667,6 +667,7 @@ static int nfs_vmtruncate(struct inode * inode, loff_t offset)
>  	spin_unlock(&inode->i_lock);
>  	truncate_pagecache(inode, offset);
>  	spin_lock(&inode->i_lock);
> +	fscache_resize_cookie(nfs_i_fscache(inode), i_size_read(inode));
>  out:
>  	return err;
>  }

truncate can happen even when you have no open file descriptors on the
file and therefore w/o the cookie being "used". In the ceph vmtruncate
handling code, I do an explicit use/unuse around this call. Do you need
to do the same here?
-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

