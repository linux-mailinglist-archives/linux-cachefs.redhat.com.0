Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id BEA873F603D
	for <lists+linux-cachefs@lfdr.de>; Tue, 24 Aug 2021 16:24:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629815062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=50URsfkFagYFE3CNoHs/Jt6UJ2zQJOC5o2D9YrQDE74=;
	b=ZdWfRzPIWc8Nn/cDChE2MwB+Ub9mmxasW4SS7v+ra7uYNB9/Sw6l5r9Ls7Nvf7D1yvd7Qe
	CmLZ0tdBTWWxR00R+o9IUc1gK14s7mVuKO+1EAMfd6BYwC2wdSgbhZbshTpe9AqOG5IpFY
	qauNAAQVxUa9F/MmOxt7lLm84WbZRRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-zYWg7OP9MZ6EaQnT919OQg-1; Tue, 24 Aug 2021 10:24:21 -0400
X-MC-Unique: zYWg7OP9MZ6EaQnT919OQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D35CF189CD03;
	Tue, 24 Aug 2021 14:24:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C676660854;
	Tue, 24 Aug 2021 14:24:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 451674BB7C;
	Tue, 24 Aug 2021 14:24:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OEOE69002008 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 10:24:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 114A410EE987; Tue, 24 Aug 2021 14:24:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A16C10EE96E
	for <linux-cachefs@redhat.com>; Tue, 24 Aug 2021 14:24:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D65918A01A9
	for <linux-cachefs@redhat.com>; Tue, 24 Aug 2021 14:24:10 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-47-OSVbiuXWP3ObB-usp96D7Q-1; Tue, 24 Aug 2021 10:24:06 -0400
X-MC-Unique: OSVbiuXWP3ObB-usp96D7Q-1
Received: by mail-qt1-f197.google.com with SMTP id
	l22-20020a05622a175600b0029d63a970f6so4251627qtk.23
	for <linux-cachefs@redhat.com>; Tue, 24 Aug 2021 07:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rXM+IBI3cANg1BoBFaXjt+OJ0V+p5mrya6klP9WdYlA=;
	b=j06hIF20mrIi9W0c3An2813QS+tez8kv0Hk5S3ArmRmzeQ7OTlt+8LrEoiHbPObVvy
	lQHMe6RH4lnBYE9N6gjol1qQ2BK5Nxf0VhAxNpkkSOxc63Ly9Rvsle7H9dA5AfDiyZ0F
	13+PIGstj8UjhzegTkqzaTnvfqoTPAfhd2p4hLdzfImczWJYqd1fEr5um0vyirQSTFWc
	FfNa6+fpZ6zM9a+iiNR4iCYXL0V0BKefPR8Ahvy+rR09abILfqR+5o/uqohpoeilawp/
	F3EgcSKEtCyK7KdBFdQcCrw0IjHIBoya0yBY7SayXDrfLOjUNqqq83E9bN4l28pF2V9E
	D7Mg==
X-Gm-Message-State: AOAM5310t7ReD5jv55184lbggy7eVyR57NXO9VXBbAF3yGGo2bUvXRY/
	RmRnWAa7bPCIlVBHy+k5tUBhPmBrMXyFDSLskTXjwEFD9LKZoTyQKVCtNYLSZVoPg9rkSqfWt5I
	AMgiPbSJlmhB5MLPMFOLTSQ==
X-Received: by 2002:ae9:ea19:: with SMTP id f25mr8455951qkg.341.1629815045888; 
	Tue, 24 Aug 2021 07:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0k36wj5zNWxDPPKfaTblHo9ascSv6RZDAgZIszilZOADFHpaoZorFodsGnWRqf0RVmvNYxA==
X-Received: by 2002:ae9:ea19:: with SMTP id f25mr8455927qkg.341.1629815045702; 
	Tue, 24 Aug 2021 07:24:05 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154])
	by smtp.gmail.com with ESMTPSA id f29sm273492qtv.34.2021.08.24.07.24.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Aug 2021 07:24:05 -0700 (PDT)
Message-ID: <6370d0a74c3ceb79c53305a64ba7a982d16d34b4.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Tue, 24 Aug 2021 10:24:04 -0400
In-Reply-To: <162431203107.2908479.3259582550347000088.stgit@warthog.procyon.org.uk>
References: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
	<162431203107.2908479.3259582550347000088.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	Steve French <sfrench@samba.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org, David
Subject: Re: [Linux-cachefs] [PATCH 11/12] fscache: Fix fscache_cookie_put()
 to not deref after dec
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-06-21 at 22:47 +0100, David Howells wrote:
> fscache_cookie_put() accesses the cookie it has just put inside the
> tracepoint that monitors the change - but this is something it's not
> allowed to do if we didn't reduce the count to zero.

Do you mean "if the count went to zero." ?

> 
> Fix this by dropping most of those values from the tracepoint and grabbing
> the cookie debug ID before doing the dec.
> 
> Also take the opportunity to switch over the usage and where arguments on
> the tracepoint to put the reason last.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> 
>  fs/fscache/cookie.c            |   10 ++++++----
>  fs/fscache/internal.h          |    2 +-
>  fs/fscache/netfs.c             |    2 +-
>  include/trace/events/fscache.h |   24 +++++++-----------------
>  4 files changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
> index 2558814193e9..6df3732cf1b4 100644
> --- a/fs/fscache/cookie.c
> +++ b/fs/fscache/cookie.c
> @@ -225,8 +225,8 @@ struct fscache_cookie *fscache_hash_cookie(struct fscache_cookie *candidate)
>  
>  collision:
>  	if (test_and_set_bit(FSCACHE_COOKIE_ACQUIRED, &cursor->flags)) {
> -		trace_fscache_cookie(cursor, fscache_cookie_collision,
> -				     atomic_read(&cursor->usage));
> +		trace_fscache_cookie(cursor->debug_id, atomic_read(&cursor->usage),
> +				     fscache_cookie_collision);
>  		pr_err("Duplicate cookie detected\n");
>  		fscache_print_cookie(cursor, 'O');
>  		fscache_print_cookie(candidate, 'N');
> @@ -305,7 +305,8 @@ struct fscache_cookie *__fscache_acquire_cookie(
>  
>  	cookie = fscache_hash_cookie(candidate);
>  	if (!cookie) {
> -		trace_fscache_cookie(candidate, fscache_cookie_discard, 1);
> +		trace_fscache_cookie(candidate->debug_id, 1,
> +				     fscache_cookie_discard);
>  		goto out;
>  	}
>  
> @@ -866,8 +867,9 @@ void fscache_cookie_put(struct fscache_cookie *cookie,
>  	_enter("%x", cookie->debug_id);
>  
>  	do {
> +		unsigned int cookie_debug_id = cookie->debug_id;
>  		usage = atomic_dec_return(&cookie->usage);
> -		trace_fscache_cookie(cookie, where, usage);
> +		trace_fscache_cookie(cookie_debug_id, usage, where);
>  
>  		if (usage > 0)
>  			return;
> diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
> index a49136c63e4b..345105dbbfd1 100644
> --- a/fs/fscache/internal.h
> +++ b/fs/fscache/internal.h
> @@ -291,7 +291,7 @@ static inline void fscache_cookie_get(struct fscache_cookie *cookie,
>  {
>  	int usage = atomic_inc_return(&cookie->usage);
>  
> -	trace_fscache_cookie(cookie, where, usage);
> +	trace_fscache_cookie(cookie->debug_id, usage, where);
>  }
>  
>  /*
> diff --git a/fs/fscache/netfs.c b/fs/fscache/netfs.c
> index cce92216fa28..d6bdb7b5e723 100644
> --- a/fs/fscache/netfs.c
> +++ b/fs/fscache/netfs.c
> @@ -37,7 +37,7 @@ int __fscache_register_netfs(struct fscache_netfs *netfs)
>  	if (!cookie)
>  		goto already_registered;
>  	if (cookie != candidate) {
> -		trace_fscache_cookie(candidate, fscache_cookie_discard, 1);
> +		trace_fscache_cookie(candidate->debug_id, 1, fscache_cookie_discard);
>  		fscache_free_cookie(candidate);
>  	}
>  
> diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
> index 0b9e058aba4d..55b8802740fa 100644
> --- a/include/trace/events/fscache.h
> +++ b/include/trace/events/fscache.h
> @@ -160,37 +160,27 @@ fscache_cookie_traces;
>  
>  
>  TRACE_EVENT(fscache_cookie,
> -	    TP_PROTO(struct fscache_cookie *cookie,
> -		     enum fscache_cookie_trace where,
> -		     int usage),
> +	    TP_PROTO(unsigned int cookie_debug_id,
> +		     int usage,
> +		     enum fscache_cookie_trace where),
>  
> -	    TP_ARGS(cookie, where, usage),
> +	    TP_ARGS(cookie_debug_id, usage, where),
>  
>  	    TP_STRUCT__entry(
>  		    __field(unsigned int,		cookie		)
> -		    __field(unsigned int,		parent		)
>  		    __field(enum fscache_cookie_trace,	where		)
>  		    __field(int,			usage		)
> -		    __field(int,			n_children	)
> -		    __field(int,			n_active	)
> -		    __field(u8,				flags		)
>  			     ),
>  
>  	    TP_fast_assign(
> -		    __entry->cookie	= cookie->debug_id;
> -		    __entry->parent	= cookie->parent ? cookie->parent->debug_id : 0;
> +		    __entry->cookie	= cookie_debug_id;
>  		    __entry->where	= where;
>  		    __entry->usage	= usage;
> -		    __entry->n_children	= atomic_read(&cookie->n_children);
> -		    __entry->n_active	= atomic_read(&cookie->n_active);
> -		    __entry->flags	= cookie->flags;
>  			   ),
>  
> -	    TP_printk("%s c=%08x u=%d p=%08x Nc=%d Na=%d f=%02x",
> +	    TP_printk("%s c=%08x u=%d",
>  		      __print_symbolic(__entry->where, fscache_cookie_traces),
> -		      __entry->cookie, __entry->usage,
> -		      __entry->parent, __entry->n_children, __entry->n_active,
> -		      __entry->flags)
> +		      __entry->cookie, __entry->usage)
>  	    );
>  
>  TRACE_EVENT(fscache_netfs,
> 
> 

Patch itself looks fine though.
-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

