Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B04964E8677
	for <lists+linux-cachefs@lfdr.de>; Sun, 27 Mar 2022 09:17:28 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-kWZvZ-J-NAGyL52uC-SD2A-1; Sun, 27 Mar 2022 03:17:24 -0400
X-MC-Unique: kWZvZ-J-NAGyL52uC-SD2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D07E4185A794;
	Sun, 27 Mar 2022 07:17:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C86512166B25;
	Sun, 27 Mar 2022 07:17:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C365E19451F3;
	Sun, 27 Mar 2022 07:17:20 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58FF619451EF for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 27 Mar 2022 07:17:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E13EF1121320; Sun, 27 Mar 2022 07:17:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB1F71121319
 for <linux-cachefs@redhat.com>; Sun, 27 Mar 2022 07:17:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D71AE101AA44
 for <linux-cachefs@redhat.com>; Sun, 27 Mar 2022 07:17:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-y0dqypWfOP2_ZOtA7MNr-g-1; Sun, 27 Mar 2022 03:17:09 -0400
X-MC-Unique: y0dqypWfOP2_ZOtA7MNr-g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD66F60F57;
 Sun, 27 Mar 2022 07:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EFAC340EC;
 Sun, 27 Mar 2022 07:11:09 +0000 (UTC)
Date: Sun, 27 Mar 2022 09:11:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kushagra765@outlook.com
Message-ID: <YkAOCrbbrMaYkiSb@kroah.com>
References: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
In-Reply-To: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [ PATCH ] Documentation: fixed doc-build
 warnings
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, daniel@ffwll.ch, arnd@arndb.de,
 corbet@lwn.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, mcgrof@kernel.org,
 linux-cachefs@redhat.com, viro@zeniv.linux.org.uk, tzimmermann@suse.de,
 akpm@linux-foundation.org
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

On Sat, Mar 26, 2022 at 05:22:55PM +0530, kushagra765@outlook.com wrote:
> >From 9a9918b051d5709b5e14ca8afa29f3ef644b8688 Mon Sep 17 00:00:00 2001
> From: Kushagra Verma <kushagra765@outlook.com>
> Date: Sat, 26 Mar 2022 16:43:15 +0530
> Subject: [PATCH] Documentation: fixed doc-build warnings

This should not be in the body of the email, please fix :(

> 
>    This patch fixes the following (and 2 other) doc-build warnings:
>       1. ./include/linux/dcache.h:308: warning: expecting prototype for dget, dget_dlock(). Prototype was for dget_dlock() instead
> 
>       2. ./include/linux/fscache.h:268: warning: Excess function parameter 'object' description in 'fscache_use_cookie'
> 
>       3 ./include/linux/fscache.h:285: warning: Excess function parameter 'object' description in 'fscache_unuse_cookie'
> 
>       4. ./drivers/gpu/drm/drm_format_helper.c:640: warning: Excess function parameter 'src' description in 'drm_fb_xrgb8888_to_mono_reversed'

This needs to be split up into one-patch-per-subsystem and can not be
taken as-is.

thanks,

greg k-h

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

