Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED574F9F81
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 Apr 2022 00:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649456049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ntIZA71juxh82ebEiXcny3iHyBNe+4cWvkEL8HXUOls=;
	b=Rc2oTwzzI3s3+FU91ZF8CPezjULbR13ODFXibbGPw9bt5/zKfVk0QcXtrerkN4LaynFO/p
	weHTyybgzRdtoqAsvZuLVAigJtvlmGhMLTf4jsQpxIbPbA96M+leG9Mi+qk5vjvMubh3oM
	ctMqSYedZmGI5fexFdANzdF/u3eMg4M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-pBGEsVFwMSOsNSDAiNtivQ-1; Fri, 08 Apr 2022 18:14:06 -0400
X-MC-Unique: pBGEsVFwMSOsNSDAiNtivQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75C6829DD983;
	Fri,  8 Apr 2022 22:14:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C5FE40314F;
	Fri,  8 Apr 2022 22:14:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8A6F0194034A;
	Fri,  8 Apr 2022 22:14:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 91E7A1940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  8 Apr 2022 22:14:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6240E434849; Fri,  8 Apr 2022 22:14:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44FA6434836;
 Fri,  8 Apr 2022 22:14:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220405142810.8208-1-dwysocha@redhat.com>
References: <20220405142810.8208-1-dwysocha@redhat.com>
To: Dave Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Fri, 08 Apr 2022 23:13:59 +0100
Message-ID: <755950.1649456039@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v2] cachefiles: Fix KASAN
 slab-out-of-bounds in cachefiles_set_volume_xattr
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
Cc: smfrench@gmail.com, linux-cachefs@redhat.com, jlayton@kernel.org,
 linux-cifs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <755949.1649456039.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dave Wysochanski <dwysocha@redhat.com> wrote:

> -	len += sizeof(*buf);
> -	buf = kmalloc(len, GFP_KERNEL);
> +	buf = kmalloc(sizeof(*buf) + len, GFP_KERNEL);

Okay, your V2 is wrong and your V1 is correct (len must include the reserverd
word so that it gets saved onto disk).

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

