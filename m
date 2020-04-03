Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3862A19D974
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Apr 2020 16:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585925364;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZTQ0LYVXNTkZUS+DJu9Ebap6fMSFhLIvWTQpoZpwW5I=;
	b=RhaD+xIyoT0Ch8H3lx9TeEqs9/9trHNbUt9x1IKszPF28CMIQUSUscQt0mqTDVIEWeSGE7
	cpLhhYIslf0FxpP3xoV5keuOuV8cV7lUTMVBb+Re7DjlW8s6+feCea0y9slwIObaJfpwco
	eRkdgUlrPEYNNF+bYOMqQ1I6BSwLoi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-uHZSG1dQPxWjGZwtBbvIcw-1; Fri, 03 Apr 2020 10:49:21 -0400
X-MC-Unique: uHZSG1dQPxWjGZwtBbvIcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1B238017F6;
	Fri,  3 Apr 2020 14:49:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B6629A251;
	Fri,  3 Apr 2020 14:49:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 931E818034E9;
	Fri,  3 Apr 2020 14:49:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033En6fL026862 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 10:49:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 14FF02166B32; Fri,  3 Apr 2020 14:49:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 112BD2166B2E
	for <linux-cachefs@redhat.com>; Fri,  3 Apr 2020 14:49:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C91C8001EA
	for <linux-cachefs@redhat.com>; Fri,  3 Apr 2020 14:49:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-144-m5_UPcr9PkioL8dQJ1fePQ-1;
	Fri, 03 Apr 2020 10:49:00 -0400
X-MC-Unique: m5_UPcr9PkioL8dQJ1fePQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D4ADDACE3;
	Fri,  3 Apr 2020 14:48:57 +0000 (UTC)
Received: from localhost (webern.olymp [local])
	by webern.olymp (OpenSMTPD) with ESMTPA id 9113dd72;
	Fri, 3 Apr 2020 15:48:57 +0100 (WEST)
Date: Fri, 3 Apr 2020 15:48:57 +0100
From: Luis Henriques <lhenriques@suse.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200403144857.GA22068@suse.com>
References: <20200309161643.GA92486@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200309161643.GA92486@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 033En6fL026862
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] fscache: drop fscache_cookie_put on
 duplicated cookies in the hash
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
Content-Disposition: inline

Ping?

Cheers,
--
Luis

On Mon, Mar 09, 2020 at 04:16:43PM +0000, Luis Henriques wrote:
> When there's a collision due to a duplicate cookie, __fscache_register_netfs
> will do an fscache_cookie_put.  This, however, isn't required as
> fscache_cookie_get hasn't been executed, and will lead to a NULL pointer as
> fscache_unhash_cookie will be called.
> 
> Signed-off-by: Luis Henriques <lhenriques@suse.com>
> ---
>  fs/fscache/netfs.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/fscache/netfs.c b/fs/fscache/netfs.c
> index cce92216fa28..07a55371f0a4 100644
> --- a/fs/fscache/netfs.c
> +++ b/fs/fscache/netfs.c
> @@ -52,7 +52,6 @@ int __fscache_register_netfs(struct fscache_netfs *netfs)
>  	return 0;
>  
>  already_registered:
> -	fscache_cookie_put(candidate, fscache_cookie_put_dup_netfs);
>  	_leave(" = -EEXIST");
>  	return -EEXIST;
>  }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

