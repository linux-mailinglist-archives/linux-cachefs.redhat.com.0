Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0BC4E9684
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 14:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648470382;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LXg+NVS91zITyQ9rkbHxdlhqDKZ+a8KZ6Iu/mxLBZs8=;
	b=KmyP7DqVDtW1AYAtS7loIB4A4PpkY39DBb+B4UAz2Hb6f6h8o1o1CbsiTaU39d5UmqlaWc
	rmRPh4mqF7DRn7dAA8wtHwTLctApXoQlAYgtYExRpQFUmHpYAHMsEQFIHrdOb+2j3T0JDn
	L8ZeocCBpQ8M9ceg9sb8MREdUAZj+Gs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-xP9-Z96TOMKjHeW6SffusQ-1; Mon, 28 Mar 2022 08:26:18 -0400
X-MC-Unique: xP9-Z96TOMKjHeW6SffusQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 484D33C00111;
	Mon, 28 Mar 2022 12:26:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB6E6407EE69;
	Mon, 28 Mar 2022 12:25:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C42D21940343;
	Mon, 28 Mar 2022 12:25:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 08A751947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 28 Mar 2022 12:25:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A69F77AF2; Mon, 28 Mar 2022 12:25:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A28697AC3;
 Mon, 28 Mar 2022 12:25:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
To: kushagra765@outlook.com
MIME-Version: 1.0
Date: Mon, 28 Mar 2022 13:25:39 +0100
Message-ID: <2581031.1648470339@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
 corbet@lwn.net, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, mcgrof@kernel.org, linux-cachefs@redhat.com,
 viro@zeniv.linux.org.uk, tzimmermann@suse.de, akpm@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2581030.1648470339.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

kushagra765@outlook.com wrote:

> @@ -256,7 +256,6 @@ struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
>  
>  /**
>   * fscache_use_cookie - Request usage of cookie attached to an object
> - * @object: Object description
>   * @will_modify: If cache is expected to be modified locally
>   *
>   * Request usage of the cookie attached to an object.  The caller should tell
> @@ -272,7 +271,6 @@ static inline void fscache_use_cookie(struct fscache_cookie *cookie,
>  
>  /**
>   * fscache_unuse_cookie - Cease usage of cookie attached to an object
> - * @object: Object description
>   * @aux_data: Updated auxiliary data (or NULL)
>   * @object_size: Revised size of the object (or NULL)
>   *

Just deleting these lines is the wrong thing to do.  They should instead
mention the cookie parameter.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

