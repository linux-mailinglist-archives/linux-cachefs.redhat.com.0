Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A9873A223
	for <lists+linux-cachefs@lfdr.de>; Thu, 22 Jun 2023 15:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687441577;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6c8uabYG4ujJWjctEp8LpGbblJEdxFH2D6IhVVsHpCU=;
	b=bi7sf+pLGMPy25CPD3aureW/SyzRZogEicSvx5/SE32vkTRoOpz73+rB5uEPclKw0OI9SA
	LbbWVp+jQOR4V+OqeJzf2n3hlEEnRkFekfXf6LJlRL+grPEpdXa1MvehvpdKNN149cgabI
	gNGodMuDn8RZ6bmRmK3+Dt1W8WHwGHA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-AMoGpsyPPpWAaFNsmJebEg-1; Thu, 22 Jun 2023 09:46:14 -0400
X-MC-Unique: AMoGpsyPPpWAaFNsmJebEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D86D1044592;
	Thu, 22 Jun 2023 13:46:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1564440C2072;
	Thu, 22 Jun 2023 13:46:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4D497194658D;
	Thu, 22 Jun 2023 13:46:04 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71DB61946587 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 22 Jun 2023 13:42:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 51D0AC1ED97; Thu, 22 Jun 2023 13:42:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D804C478C7;
 Thu, 22 Jun 2023 13:42:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20230615160806.94000-1-marcel@holtmann.org>
References: <20230615160806.94000-1-marcel@holtmann.org>
To: Marcel Holtmann <marcel@holtmann.org>
MIME-Version: 1.0
Date: Thu, 22 Jun 2023 14:42:54 +0100
Message-ID: <1886146.1687441374@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: gregkh@linuxfoundation.org, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1886145.1687441374.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Marcel Holtmann <marcel@holtmann.org> wrote:

> The cachefiles misc character device uses MISC_DYNAMIC_MINOR and thus
> doesn't support module auto-loading. Assign a static minor number for it
> and provide appropriate module aliases for it. This is enough for kmod to
> create the /dev/cachefiles device node on startup and facility module
> auto-loading.

Why?  The systemd unit file for it just modprobe's the module first.  It's a
specialist device file only for use by the appropriate daemon.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

