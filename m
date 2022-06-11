Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A245D547780
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Jun 2022 22:27:34 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-McmEV7vGOGCfRmTzgO9rDg-1; Sat, 11 Jun 2022 16:27:29 -0400
X-MC-Unique: McmEV7vGOGCfRmTzgO9rDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46A0E1C05AE6;
	Sat, 11 Jun 2022 20:27:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78F772166B26;
	Sat, 11 Jun 2022 20:27:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA5391947061;
	Sat, 11 Jun 2022 20:27:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0790E1947059 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Jun 2022 14:01:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EAAFA402494D; Sat, 11 Jun 2022 14:00:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E652840466A4
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 14:00:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDED9801E67
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 14:00:59 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-NIphYPefOGmSSNwvzuXBwQ-1; Sat, 11 Jun 2022 10:00:55 -0400
X-MC-Unique: NIphYPefOGmSSNwvzuXBwQ-1
Received: by mail-pf1-f181.google.com with SMTP id x138so1827671pfc.12;
 Sat, 11 Jun 2022 07:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=c9HBwLp0Uv5MjgxnDuQRISysx2V5J/58czPWYFl7Y+c=;
 b=olLusMv2ZkbWH8jmOupC8hFxHPyLmLDCz6+GTXDooJhxPrVBoHzF4hGudu+8ZJYhYM
 GuqP3PP2zazfRIp0h8WjdJxHOTfuyuoVjPaNZg4ThKZjuXnQ9FwIFV9/Dpt/ue/4mf5C
 lXogHjtt7yP99k7rgpSY4RsslkXf38WhT6qFxND3usE04DqPRGG+ZHAbuFXcSENMbO2m
 cgPa2cmZ9+vgkqJR5fqp311hDnJmvs0zTa+ch9bjoYeMxrePhpu6IY5dQrfajJs9T7tf
 bi+wD8O2Tu5wsEaQndzPK7/hdgvenB8YpjYM2RMaBELrA4UtppZpeyOEsKfifq5M5ZOR
 yF9A==
X-Gm-Message-State: AOAM533fNXhu/04sqFs8YjTkXs4hxduSedhovx9A9w5X3hYU0DRMAcsP
 qRNBpc69lUHrYRNOXxXCl9A=
X-Google-Smtp-Source: ABdhPJx8aXzG7lARTjf0DGMNWJ7cU2i9+ckERmOuVpIwDU+ICn1bZ2jiI0zO6THloqk9kmx74bkHfg==
X-Received: by 2002:a63:2a0c:0:b0:3fc:9b04:541d with SMTP id
 q12-20020a632a0c000000b003fc9b04541dmr44653939pgq.546.1654956054512; 
 Sat, 11 Jun 2022 07:00:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a170902d5ca00b00163d4dc6e95sm1528126plh.307.2022.06.11.07.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 07:00:54 -0700 (PDT)
Date: Sat, 11 Jun 2022 07:00:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20220611140052.GA288528@roeck-us.net>
References: <YqRyL2sIqQNDfky2@debian> <YqSGv6uaZzLxKfmG@zeniv-ca.linux.org.uk>
 <YqSMmC/UuQpXdxtR@zeniv-ca.linux.org.uk>
 <YqSQ++8UnEW0AJ2y@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YqSQ++8UnEW0AJ2y@zeniv-ca.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Sat, 11 Jun 2022 20:27:25 +0000
Subject: Re: [Linux-cachefs] mainline build failure due to 6c77676645ad
 ("iov_iter: Fix iter_xarray_get_pages{, _alloc}()")
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-erofs@lists.ozlabs.org,
 linux-afs@lists.infradead.org, devel@lists.orangefs.org,
 Mike Marshall <hubcap@omnibond.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 11, 2022 at 12:56:27PM +0000, Al Viro wrote:
> On Sat, Jun 11, 2022 at 12:37:44PM +0000, Al Viro wrote:
> > On Sat, Jun 11, 2022 at 12:12:47PM +0000, Al Viro wrote:
> > 
> > 
> > > At a guess, should be
> > > 	return min((size_t)nr * PAGE_SIZE - offset, maxsize);
> > > 
> > > in both places.  I'm more than half-asleep right now; could you verify that it
> > > (as the last lines of both iter_xarray_get_pages() and iter_xarray_get_pages_alloc())
> > > builds correctly?
> > 
> > No, I'm misreading it - it's unsigned * unsigned long - unsigned vs. size_t.
> > On arm it ends up with unsigned long vs. unsigned int; functionally it *is*
> > OK (both have the same range there), but it triggers the tests.  Try 
> > 
> > 	return min_t(size_t, nr * PAGE_SIZE - offset, maxsize);
> > 
> > there (both places).
> 
> The reason we can't overflow on multiplication there, BTW, is that we have
> nr <= count, and count has come from weirdly open-coded
> 	DIV_ROUND_UP(size + offset, PAGE_SIZE)

That is often done to avoid possible overflows. Is size + offset
guaranteed to be smaller than ULONG_MAX ?

Guenter

> IMO we'd better make it explicit, so how about the following:
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index dda6d5f481c1..150dbd314d25 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -1445,15 +1445,7 @@ static ssize_t iter_xarray_get_pages(struct iov_iter *i,
>  	offset = pos & ~PAGE_MASK;
>  	*_start_offset = offset;
>  
> -	count = 1;
> -	if (size > PAGE_SIZE - offset) {
> -		size -= PAGE_SIZE - offset;
> -		count += size >> PAGE_SHIFT;
> -		size &= ~PAGE_MASK;
> -		if (size)
> -			count++;
> -	}
> -
> +	count = DIV_ROUND_UP(size + offset, PAGE_SIZE);
>  	if (count > maxpages)
>  		count = maxpages;
>  
> @@ -1461,7 +1453,7 @@ static ssize_t iter_xarray_get_pages(struct iov_iter *i,
>  	if (nr == 0)
>  		return 0;
>  
> -	return min(nr * PAGE_SIZE - offset, maxsize);
> +	return min_t(size_t, nr * PAGE_SIZE - offset, maxsize);
>  }
>  
>  /* must be done on non-empty ITER_IOVEC one */
> @@ -1607,15 +1599,7 @@ static ssize_t iter_xarray_get_pages_alloc(struct iov_iter *i,
>  	offset = pos & ~PAGE_MASK;
>  	*_start_offset = offset;
>  
> -	count = 1;
> -	if (size > PAGE_SIZE - offset) {
> -		size -= PAGE_SIZE - offset;
> -		count += size >> PAGE_SHIFT;
> -		size &= ~PAGE_MASK;
> -		if (size)
> -			count++;
> -	}
> -
> +	count = DIV_ROUND_UP(size + offset, PAGE_SIZE);
>  	p = get_pages_array(count);
>  	if (!p)
>  		return -ENOMEM;
> @@ -1625,7 +1609,7 @@ static ssize_t iter_xarray_get_pages_alloc(struct iov_iter *i,
>  	if (nr == 0)
>  		return 0;
>  
> -	return min(nr * PAGE_SIZE - offset, maxsize);
> +	return min_t(size_t, nr * PAGE_SIZE - offset, maxsize);
>  }
>  
>  ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

