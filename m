Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 802D23F6274
	for <lists+linux-cachefs@lfdr.de>; Tue, 24 Aug 2021 18:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629821504;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6yAsn+snA8FpLVOeDpd9nOMC3G4exDo5fMvCLmxYYso=;
	b=HyXItNqGf1Jq4kcJkcmJ0jjIuLeP54rw+vOe6WY9AVwWg0aGC3Y3Fv30j6TvaKl9jHboGk
	YCqQZm0e3Ve7Cthf4N1XTY2oAnkLAmOPM2bG1M4VvYdR/X/H+PXaxPjopvy9ilTdg0fMGn
	Ci33poIRjwjCJyY9AysaQuWkVsBocbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-ZTAAPpm9MemogoRY6kK2-g-1; Tue, 24 Aug 2021 12:11:43 -0400
X-MC-Unique: ZTAAPpm9MemogoRY6kK2-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0A9E801A92;
	Tue, 24 Aug 2021 16:11:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23F8910016F5;
	Tue, 24 Aug 2021 16:11:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE89F4BB7C;
	Tue, 24 Aug 2021 16:11:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OGBZJ6013974 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 12:11:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25DEB204401B; Tue, 24 Aug 2021 16:11:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21185203DE74
	for <linux-cachefs@redhat.com>; Tue, 24 Aug 2021 16:11:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24C17866DFA
	for <linux-cachefs@redhat.com>; Tue, 24 Aug 2021 16:11:31 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
	[209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-451-G8_OuzfeM3yUqagjgooQuw-1; Tue, 24 Aug 2021 12:11:29 -0400
X-MC-Unique: G8_OuzfeM3yUqagjgooQuw-1
Received: by mail-qv1-f70.google.com with SMTP id
	u11-20020a0562141c0b00b0036201580785so15182363qvc.11
	for <linux-cachefs@redhat.com>; Tue, 24 Aug 2021 09:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zztC89NUsnI49tBFDzJHfqMcg0PYYsKWW693C6SIn40=;
	b=B3tmoT8h5tnDyxSJ9k+t4PjWw+ciO5yfr/YK7V0JESV7N75B4kABemr2VSK0D6v0VZ
	2xO81poxmnCBWgiOd3krLSOF8f6ae8QSNOxRYe8JP8+A7St0prDnIG/A2EK+Jh9MnzvW
	xtwjZvq6W6qUvXVr6pvOWx93lTNh3nOQUYFMiS3y1JKLnyOwpTw0hVdj1A55rOlQPK1M
	alB4lwD3maqZSqlwFJQk4mRIEqhePKUG6ZAmrs2OQobvXEzeyzgtlG7qyE+lzVAP8pZ2
	oy8QEehZ7GEkePqtItcVHSECndinD+mMVd9Rc2FDxhqsygAhjy4ogjzff25AWYX2of/i
	wMyg==
X-Gm-Message-State: AOAM530kJnVFKJhxCCvgbejhX7nrIX0OAWbEZ9LLPDqR6lfSyPHtvhQ5
	Uc1Nlbey3hLtzoZAMHP7/NN+Q1TiCVkmrK8LoQJoEA0A0a3EJgL4xlzFCMnki0lKCx8ZK1j6TQO
	6MBSmHcv4hfCpJ4CcaSalpw==
X-Received: by 2002:ac8:58ce:: with SMTP id u14mr1640609qta.99.1629821489398; 
	Tue, 24 Aug 2021 09:11:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCKqllfX/tvqrWatVeQf20ul8F8guKIBuisU0F+aEkBMrzdmA5+I16yDHMCyu87N39B0rdPQ==
X-Received: by 2002:ac8:58ce:: with SMTP id u14mr1640586qta.99.1629821489175; 
	Tue, 24 Aug 2021 09:11:29 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	l13sm11361132qkp.97.2021.08.24.09.11.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Aug 2021 09:11:28 -0700 (PDT)
Message-ID: <3d98729b59c2afcad1299a7742211bcdf1598623.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Tue, 24 Aug 2021 12:11:27 -0400
In-Reply-To: <162431201844.2908479.8293647220901514696.stgit@warthog.procyon.org.uk>
References: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
	<162431201844.2908479.8293647220901514696.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	Steve French <sfrench@samba.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org, David
Subject: Re: [Linux-cachefs] [PATCH 10/12] fscache: Fix cookie key hashing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-06-21 at 22:46 +0100, David Howells wrote:
> The current hash algorithm used for hashing cookie keys is really bad,
> producing almost no dispersion (after a test kernel build, ~30000 files
> were split over just 18 out of the 32768 hash buckets).
> 
> Borrow the full_name_hash() hash function into fscache to do the hashing
> for cookie keys and, in the future, volume keys.
> 
> I don't want to use full_name_hash() as-is because I want the hash value to
> be consistent across arches and over time as the hash value produced may
> get used on disk.
> 
> I can also optimise parts of it away as the key will always be a padded
> array of aligned 32-bit words.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> 

What happens when this patch encounters a cache that was built before
it? Do you need to couple this with some sort of global cache
invalidation or rehashing event?

>  fs/fscache/cookie.c   |   14 +-------------
>  fs/fscache/internal.h |    2 ++
>  fs/fscache/main.c     |   39 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
> index ec9bce33085f..2558814193e9 100644
> --- a/fs/fscache/cookie.c
> +++ b/fs/fscache/cookie.c
> @@ -87,10 +87,8 @@ void fscache_free_cookie(struct fscache_cookie *cookie)
>  static int fscache_set_key(struct fscache_cookie *cookie,
>  			   const void *index_key, size_t index_key_len)
>  {
> -	unsigned long long h;
>  	u32 *buf;
>  	int bufs;
> -	int i;
>  
>  	bufs = DIV_ROUND_UP(index_key_len, sizeof(*buf));
>  
> @@ -104,17 +102,7 @@ static int fscache_set_key(struct fscache_cookie *cookie,
>  	}
>  
>  	memcpy(buf, index_key, index_key_len);
> -
> -	/* Calculate a hash and combine this with the length in the first word
> -	 * or first half word
> -	 */
> -	h = (unsigned long)cookie->parent;
> -	h += index_key_len + cookie->type;
> -
> -	for (i = 0; i < bufs; i++)
> -		h += buf[i];
> -
> -	cookie->key_hash = h ^ (h >> 32);
> +	cookie->key_hash = fscache_hash(0, buf, bufs);
>  	return 0;
>  }
>  
> diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
> index 200082cafdda..a49136c63e4b 100644
> --- a/fs/fscache/internal.h
> +++ b/fs/fscache/internal.h
> @@ -74,6 +74,8 @@ extern struct workqueue_struct *fscache_object_wq;
>  extern struct workqueue_struct *fscache_op_wq;
>  DECLARE_PER_CPU(wait_queue_head_t, fscache_object_cong_wait);
>  
> +extern unsigned int fscache_hash(unsigned int salt, unsigned int *data, unsigned int n);
> +
>  static inline bool fscache_object_congested(void)
>  {
>  	return workqueue_congested(WORK_CPU_UNBOUND, fscache_object_wq);
> diff --git a/fs/fscache/main.c b/fs/fscache/main.c
> index c1e6cc9091aa..4207f98e405f 100644
> --- a/fs/fscache/main.c
> +++ b/fs/fscache/main.c
> @@ -93,6 +93,45 @@ static struct ctl_table fscache_sysctls_root[] = {
>  };
>  #endif
>  
> +/*
> + * Mixing scores (in bits) for (7,20):
> + * Input delta: 1-bit      2-bit
> + * 1 round:     330.3     9201.6
> + * 2 rounds:   1246.4    25475.4
> + * 3 rounds:   1907.1    31295.1
> + * 4 rounds:   2042.3    31718.6
> + * Perfect:    2048      31744
> + *            (32*64)   (32*31/2 * 64)
> + */
> +#define HASH_MIX(x, y, a)	\
> +	(	x ^= (a),	\
> +	y ^= x,	x = rol32(x, 7),\
> +	x += y,	y = rol32(y,20),\
> +	y *= 9			)
> +
> +static inline unsigned int fold_hash(unsigned long x, unsigned long y)
> +{
> +	/* Use arch-optimized multiply if one exists */
> +	return __hash_32(y ^ __hash_32(x));
> +}
> +
> +/*
> + * Generate a hash.  This is derived from full_name_hash(), but we want to be
> + * sure it is arch independent and that it doesn't change as bits of the
> + * computed hash value might appear on disk.  The caller also guarantees that
> + * the hashed data will be a series of aligned 32-bit words.
> + */
> +unsigned int fscache_hash(unsigned int salt, unsigned int *data, unsigned int n)
> +{
> +	unsigned int a, x = 0, y = salt;
> +
> +	for (; n; n--) {
> +		a = *data++;
> +		HASH_MIX(x, y, a);
> +	}
> +	return fold_hash(x, y);
> +}
> +
>  /*
>   * initialise the fs caching module
>   */
> 
> 

-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

