Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC573CF7F
	for <lists+linux-cachefs@lfdr.de>; Sun, 25 Jun 2023 10:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687683018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cgthlumi4jlnR8/1K3AWhTfnFrSw5IWvkaEqi+z/xc0=;
	b=UIw9CUOpXuEhuvP6girorphRVMflrcK04OzknMrj8HLi6YwPglTYrYjI0ZhlRAMPbwdpH9
	tk5SZ8GFNR1KsM15KJKLycXNc+jeoY2AKPEH7Uw+l2/6CLoXeFx9kdrc9N7h/ZCKhm+AKn
	qgDxTwTpMgWQCeXkknZ/GEveUPu+kJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-GuX6Jx7oNaGmvpSLxQI0LQ-1; Sun, 25 Jun 2023 04:50:09 -0400
X-MC-Unique: GuX6Jx7oNaGmvpSLxQI0LQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F84C185A793;
	Sun, 25 Jun 2023 08:50:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99D322166B25;
	Sun, 25 Jun 2023 08:50:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CA343194658C;
	Sun, 25 Jun 2023 08:50:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 970921946587 for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 25 Jun 2023 08:49:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C1D11F5AE5; Sun, 25 Jun 2023 08:49:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA74CF5AC5
 for <linux-cachefs@redhat.com>; Sun, 25 Jun 2023 08:49:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D36C1006E2C
 for <linux-cachefs@redhat.com>; Sun, 25 Jun 2023 08:49:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-3xGVriGFORum5rw2TdO6ZA-1; Sun, 25 Jun 2023 04:49:55 -0400
X-MC-Unique: 3xGVriGFORum5rw2TdO6ZA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5D0460B6A;
 Sun, 25 Jun 2023 08:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75B3C433C0;
 Sun, 25 Jun 2023 08:49:53 +0000 (UTC)
Date: Sun, 25 Jun 2023 10:49:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcel Holtmann <marcel@holtmann.org>
Message-ID: <2023062536-wrongful-botch-a188@gregkh>
References: <20230615160806.94000-1-marcel@holtmann.org>
MIME-Version: 1.0
In-Reply-To: <20230615160806.94000-1-marcel@holtmann.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: allocate static minor for
 /dev/cachefiles
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
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 15, 2023 at 06:08:06PM +0200, Marcel Holtmann wrote:
> The cachefiles misc character device uses MISC_DYNAMIC_MINOR and thus
> doesn't support module auto-loading. Assign a static minor number for it
> and provide appropriate module aliases for it. This is enough for kmod to
> create the /dev/cachefiles device node on startup and facility module
> auto-loading.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>  Documentation/admin-guide/devices.txt | 3 ++-
>  fs/cachefiles/main.c                  | 4 +++-
>  include/linux/miscdevice.h            | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
> index 06c525e01ea5..21b2dda10006 100644
> --- a/Documentation/admin-guide/devices.txt
> +++ b/Documentation/admin-guide/devices.txt
> @@ -376,8 +376,9 @@
>  		240 = /dev/userio	Serio driver testing device
>  		241 = /dev/vhost-vsock	Host kernel driver for virtio vsock
>  		242 = /dev/rfkill	Turning off radio transmissions (rfkill)
> +		243 = /dev/cachefiles	Filesystem caching on files
>  
> -		243-254			Reserved for local use
> +		244-254			Reserved for local use
>  		255			Reserved for MISC_DYNAMIC_MINOR
>  
>    11 char	Raw keyboard device	(Linux/SPARC only)
> diff --git a/fs/cachefiles/main.c b/fs/cachefiles/main.c
> index 3f369c6f816d..eead7b5016a7 100644
> --- a/fs/cachefiles/main.c
> +++ b/fs/cachefiles/main.c
> @@ -30,11 +30,13 @@ MODULE_PARM_DESC(cachefiles_debug, "CacheFiles debugging mask");
>  MODULE_DESCRIPTION("Mounted-filesystem based cache");
>  MODULE_AUTHOR("Red Hat, Inc.");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS("devname:cachefiles");
> +MODULE_ALIAS_MISCDEV(CACHEFILES_MINOR);
>  
>  struct kmem_cache *cachefiles_object_jar;
>  
>  static struct miscdevice cachefiles_dev = {
> -	.minor	= MISC_DYNAMIC_MINOR,
> +	.minor	= CACHEFILES_MINOR,
>  	.name	= "cachefiles",
>  	.fops	= &cachefiles_daemon_fops,
>  };
> diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
> index c0fea6ca5076..d7f989f593b0 100644
> --- a/include/linux/miscdevice.h
> +++ b/include/linux/miscdevice.h
> @@ -71,6 +71,7 @@
>  #define USERIO_MINOR		240
>  #define VHOST_VSOCK_MINOR	241
>  #define RFKILL_MINOR		242
> +#define CACHEFILES_MINOR	243
>  #define MISC_DYNAMIC_MINOR	255
>  
>  struct device;
> -- 
> 2.40.1
> 

Ah, the original was in my spam filter as your email does not show up as
being authenticated, you might want to fix your mail server :(

Anyway, as Christoph said, no, this isn't a good idea, keep it dynamic
and only load it if you need to load it please.  Or, please explain why
it needs to be autoloaded, what dependancy or userspace program is not
working properly because of this?

thanks,

greg k-h

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

