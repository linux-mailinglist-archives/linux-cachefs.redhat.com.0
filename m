Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD44EBCF8
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Mar 2022 10:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648630312;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I0JHLzMxuGgGCpsqU6JX11aVkoIJzeC8okkCd8E9ruU=;
	b=PLB2TknGX+9Hm57MC23i+xzkr41hPjMuzM77FxuVU+AW2prgWBaLJPHl0gy42h0IbXWgsS
	zXa1E6Ns12bkDH4Rfko4Wfrd/BxYT/0CxJmcVufPfnd1MusTXlX7S0+GBn/04k6wNQUAPx
	Hf4/IIMT0mw3ptRPi91xeUEgZrKXmos=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-isG3MKX0P0WlhXAtypBvXQ-1; Wed, 30 Mar 2022 04:51:49 -0400
X-MC-Unique: isG3MKX0P0WlhXAtypBvXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94176185A7BA;
	Wed, 30 Mar 2022 08:51:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 300AF1121314;
	Wed, 30 Mar 2022 08:51:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4067D19451F1;
	Wed, 30 Mar 2022 08:51:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D891619466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 30 Mar 2022 08:51:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B239A400E546; Wed, 30 Mar 2022 08:51:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A912D40CF8E4;
 Wed, 30 Mar 2022 08:51:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220330045446.128455-1-jefflexu@linux.alibaba.com>
References: <20220330045446.128455-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Wed, 30 Mar 2022 09:51:36 +0100
Message-ID: <2917164.1648630296@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: revert inode in use in
 error path
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2917163.1648630296.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Subject: [PATCH] cachefiles: revert inode in use in error path

Can you say "Unmark" rather than "revert"?  I would tend to reserve the word
"revert" for when I'm reverting a commit.

> @@ -494,15 +502,20 @@ struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
> ...
> +out_unuse:
> +	cachefiles_do_unmark_inode_in_use(object, path.dentry);

It shouldn't matter here.  We're dealing with a tmpfile, so we shouldn't ever
see it again.  If we do, it's a bug in the backing filesystem.  OTOH, I
suppose it makes sense to clear it anyway.

> @@ -574,8 +587,16 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
>  	_debug("file -> %pd positive", dentry);
>  
>  	ret = cachefiles_check_auxdata(object, file);
> -	if (ret < 0)
> -		goto check_failed;
> +	if (ret < 0) {
> +		fscache_cookie_lookup_negative(object->cookie);
> +		cachefiles_unmark_inode_in_use(object, file);
> +		fput(file);
> +		dput(dentry);
> +
> +		if (ret == -ESTALE)
> +			return cachefiles_create_file(object);
> +		return false;
> +	}
>  
>  	object->file = file;
>  
> @@ -587,17 +608,10 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
>  	dput(dentry);
>  	return true;
>  
> -check_failed:
> -	fscache_cookie_lookup_negative(object->cookie);
> -	cachefiles_unmark_inode_in_use(object, file);
> -	if (ret == -ESTALE) {
> -		fput(file);
> -		dput(dentry);
> -		return cachefiles_create_file(object);
> -	}
>  error_fput:
>  	fput(file);
>  error:
> +	cachefiles_do_unmark_inode_in_use(object, dentry);
>  	dput(dentry);
>  	return false;
>  }

Okay, you are correct here, but could you leave the "check_failed:" label
where it is and make your rearrangements there?  That way the error handling
is outside the main path through the function.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

