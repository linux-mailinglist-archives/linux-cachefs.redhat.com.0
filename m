Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB373A41D
	for <lists+linux-cachefs@lfdr.de>; Thu, 22 Jun 2023 17:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687446167;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v0CxXObF2CCjM5+vdFB1xohPeDqLNOZqNJSU/0RmRXU=;
	b=gvAp76ckAigNPjbTJ0opkWsa51IE/y5PicYzonkF4aly1SHJwHX7AHo6efjzU/GO7Aer6v
	Ekj9uTpZKmWgdLxniAm0RcByOnzRU781CcRzJj5F7jnVqS18ITa9Ya4wJbh7TY8ljlUpI/
	2235x9vcoiOMrn5RoSzQsihCk02tpRU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-1hM-VY7xNI2s0HtZXRMqIA-1; Thu, 22 Jun 2023 11:02:40 -0400
X-MC-Unique: 1hM-VY7xNI2s0HtZXRMqIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFF6688D0FD;
	Thu, 22 Jun 2023 15:02:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCB84112132C;
	Thu, 22 Jun 2023 15:02:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AA35D194658D;
	Thu, 22 Jun 2023 15:02:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3AFAE1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 22 Jun 2023 15:00:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 005C614682F8; Thu, 22 Jun 2023 15:00:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED211140EBB8
 for <linux-cachefs@redhat.com>; Thu, 22 Jun 2023 14:59:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D38C1858EED
 for <linux-cachefs@redhat.com>; Thu, 22 Jun 2023 14:59:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-mriDMDHuPISKN07osvuEOg-1; Thu, 22 Jun 2023 10:59:50 -0400
X-MC-Unique: mriDMDHuPISKN07osvuEOg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7DAA6187C;
 Thu, 22 Jun 2023 14:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AF0C433C0;
 Thu, 22 Jun 2023 14:51:20 +0000 (UTC)
Date: Thu, 22 Jun 2023 16:51:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <2023062245-synopses-scared-9d96@gregkh>
References: <20230615160806.94000-1-marcel@holtmann.org>
 <1886146.1687441374@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1886146.1687441374@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 22, 2023 at 02:42:54PM +0100, David Howells wrote:
> Marcel Holtmann <marcel@holtmann.org> wrote:
> 
> > The cachefiles misc character device uses MISC_DYNAMIC_MINOR and thus
> > doesn't support module auto-loading. Assign a static minor number for it
> > and provide appropriate module aliases for it. This is enough for kmod to
> > create the /dev/cachefiles device node on startup and facility module
> > auto-loading.
> 
> Why?  The systemd unit file for it just modprobe's the module first.  It's a
> specialist device file only for use by the appropriate daemon.

And you really don't want to have auto-module-loading when trying to
open a /dev/foo file, that way lies madness in the past, please let's
learn from our mistakes :)

thanks,

greg k-h

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

