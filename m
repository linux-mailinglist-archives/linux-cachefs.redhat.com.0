Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D725D52DC3D
	for <lists+linux-cachefs@lfdr.de>; Thu, 19 May 2022 20:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652983363;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kvbCfADiTjgeQSCSjvhLaz9hzHNKZSY7cCEcypFDsQc=;
	b=hiv7o4yGg4R6xm916iSnqY/3V8cm5/h8hIiv+YMyi9jw2lRrh3QrdodcXeGtwLqCD3AJzV
	kos+jWdEIHF8IIyJLKGcHKFYnlDuxHmCi0lXJWHOw/P23zKAvNQL8JIKrz4p28Ol1riHt9
	Ym49wYJ3HtGsvseQM3HeeTyDZ5qa8/E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-P9gv5fi8MkqE6W6Qf2LLhw-1; Thu, 19 May 2022 14:02:40 -0400
X-MC-Unique: P9gv5fi8MkqE6W6Qf2LLhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C682480B90C;
	Thu, 19 May 2022 18:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 716912026D6A;
	Thu, 19 May 2022 18:02:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E61D193F6D5;
	Thu, 19 May 2022 18:02:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8147194705A for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 19 May 2022 18:02:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 638A9492C3B; Thu, 19 May 2022 18:02:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F79F492CA2
 for <linux-cachefs@redhat.com>; Thu, 19 May 2022 18:02:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47E6680B90C
 for <linux-cachefs@redhat.com>; Thu, 19 May 2022 18:02:36 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-TfX4wL1dPcSWfE27mnVONw-1; Thu, 19 May 2022 14:02:35 -0400
X-MC-Unique: TfX4wL1dPcSWfE27mnVONw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w5-20020a056402128500b0042aa2647eb6so4074182edv.12
 for <linux-cachefs@redhat.com>; Thu, 19 May 2022 11:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vRbUI4/GPSCZt1VwOoZEQyVUcK9j3r3qdubIZdOiHI=;
 b=pHvVHwOJN+G711MdZfWjeDPOcJFIaKXQ4jz4g5FlINNdcjZgZ5B3havwRkx5MtpIcR
 /AvCO7JvnmJNNOcvqMatxJdxUcioGytsfq706iQc8pa4Cc5V2XuJBWdm/QKb6T7nGT68
 kzZD/E/mnDYGlWpTZ4gShomE3tvImMq7Ol9W3omW6+hegnu6/5YeouyiWsetEGVeRci3
 J8abBqeIBu7rJBFumX4Pk6td8kqn2ZYPdmRZ+27cJD9FLhdEKuLNYBn87Hw7RdTbYq6x
 bE0GVyDAXRr286Qn0jp+MSgeMO4Lx2/+m6Nhvd0VLcb6CDskfyMM8EyqMHIOim1kaQFq
 Serg==
X-Gm-Message-State: AOAM531zjWspMtfUcX4Mn1kOWC4WqgSlRcyTgLE5SXdK84832SLhYyH6
 VzspwXxfMDZVplasq3Zc9Sak2h222EIbEmiz3q3jYIT17y7f6bADX+11BjZR+lAB5xw5IgIbgh6
 h8ArF2kdKu3WNqQvA2haX8q9RB5Aob8Wy+amaOA==
X-Received: by 2002:a05:6402:5298:b0:42a:cb63:5d10 with SMTP id
 en24-20020a056402529800b0042acb635d10mr6750415edb.415.1652983353661; 
 Thu, 19 May 2022 11:02:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn6/Tj4V8KVXox3lSlmm5Gz66eQBDgYCQAVpr2miM030h/XBUwtnvlrRGYYV9HfkeB+8UEO+uov7EtDJwHTak=
X-Received: by 2002:a05:6402:5298:b0:42a:cb63:5d10 with SMTP id
 en24-20020a056402529800b0042acb635d10mr6750403edb.415.1652983353522; Thu, 19
 May 2022 11:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <165294669215.3283481.13374322806917745974.stgit@warthog.procyon.org.uk>
In-Reply-To: <165294669215.3283481.13374322806917745974.stgit@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 19 May 2022 14:01:57 -0400
Message-ID: <CALF+zOk923ZnSucxitYQFN9m3AY=iOy+j90WrFmqZbKMuOcVsA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH] nfs: Fix fscache volume key rendering
 for endianness
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
Cc: linux-nfs <linux-nfs@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-cachefs <linux-cachefs@redhat.com>, anna@kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 19, 2022 at 3:51 AM David Howells <dhowells@redhat.com> wrote:
>
> Fix fscache volume key rendering for endianness.  Convert the BE numbers in
> the address to host-endian before printing them so that they're consistent
> if the cache is copied between architectures.
>
> Question: This change could lead to misidentification of a volume directory
> in the cache on a LE machine (it's unlikely because the port number as well
> as the address numbers all get flipped), but it was introduced in -rc1 in
> this cycle so probably isn't in any distro kernels yet.  Should I add a
> version number to enforce non-matching?
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Dave Wysochanski <dwysocha@redhat.com>
> cc: Trond Myklebust <trond.myklebust@hammerspace.com>
> cc: Anna Schumaker <anna@kernel.org>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-nfs@vger.kernel.org
> cc: linux-cachefs@redhat.com
> ---
>
>  fs/nfs/fscache.c |   14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> index f73c09a9cf0a..0e5572b192b2 100644
> --- a/fs/nfs/fscache.c
> +++ b/fs/nfs/fscache.c
> @@ -54,17 +54,17 @@ static bool nfs_fscache_get_client_key(struct nfs_client *clp,
>
>         switch (clp->cl_addr.ss_family) {
>         case AF_INET:
> -               if (!nfs_append_int(key, _len, sin->sin_port) ||
> -                   !nfs_append_int(key, _len, sin->sin_addr.s_addr))
> +               if (!nfs_append_int(key, _len, ntohs(sin->sin_port)) ||
> +                   !nfs_append_int(key, _len, ntohl(sin->sin_addr.s_addr)))
>                         return false;
>                 return true;
>
>         case AF_INET6:
> -               if (!nfs_append_int(key, _len, sin6->sin6_port) ||
> -                   !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[0]) ||
> -                   !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[1]) ||
> -                   !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[2]) ||
> -                   !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[3]))
> +               if (!nfs_append_int(key, _len, ntohs(sin6->sin6_port)) ||
> +                   !nfs_append_int(key, _len, ntohl(sin6->sin6_addr.s6_addr32[0])) ||
> +                   !nfs_append_int(key, _len, ntohl(sin6->sin6_addr.s6_addr32[1])) ||
> +                   !nfs_append_int(key, _len, ntohl(sin6->sin6_addr.s6_addr32[2])) ||
> +                   !nfs_append_int(key, _len, ntohl(sin6->sin6_addr.s6_addr32[3])))
>                         return false;
>                 return true;
>
>
>

IMO it's not worth versioning in this case but I agree with this change.
Did someone report the "cache copied between architectures" issue, or
is that mostly a theoretical problem you noticed?

Acked-by: Dave Wysochanski <dwysocha@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

