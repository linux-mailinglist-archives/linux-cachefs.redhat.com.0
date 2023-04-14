Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC14A6E24B7
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Apr 2023 15:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681480307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Gfq18sSSLCuaNJWMjUeJVc/PVQSMBWeIADI03V456H4=;
	b=FHgtCzNVs8lefjwWYNKQXZaiWd0hl+xP4SYDt8vQ0ISCqIvJUq1KMW/nvGP8PgmPVefzVH
	DXYxQWFVykyR+YH+DX4Y+vgavfaYg2XENkLaqQwcEhvUhj3XGaizPGsqU2wh0DW87goTEK
	QSTwtF9rwuC2QgNsbIK57g2/duIZVOI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-7jpfA0dRNRqsd9F2obU5VA-1; Fri, 14 Apr 2023 09:51:46 -0400
X-MC-Unique: 7jpfA0dRNRqsd9F2obU5VA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 676D83822DF3;
	Fri, 14 Apr 2023 13:51:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E6E2C16028;
	Fri, 14 Apr 2023 13:51:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0C94B19472C4;
	Fri, 14 Apr 2023 13:51:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A9C371946A7F for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 13:51:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8887840C6E20; Fri, 14 Apr 2023 13:51:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96D5140C6E70;
 Fri, 14 Apr 2023 13:51:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20230329140155.53272-3-zhujia.zj@bytedance.com>
References: <20230329140155.53272-3-zhujia.zj@bytedance.com>
 <20230329140155.53272-1-zhujia.zj@bytedance.com>
To: Jia Zhu <zhujia.zj@bytedance.com>
MIME-Version: 1.0
Date: Fri, 14 Apr 2023 14:51:31 +0100
Message-ID: <1250339.1681480291@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH V5 2/5] cachefiles: extract ondemand
 info field from cachefiles_object
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1250338.1681480291.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jia Zhu <zhujia.zj@bytedance.com> wrote:

>  #define CACHEFILES_OBJECT_STATE_FUNCS(_state, _STATE)	\
>  static inline bool								\
>  cachefiles_ondemand_object_is_##_state(const struct cachefiles_object *object) \
>  {												\
> -	return object->state == CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
> +	return object->ondemand->state == CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
>  }												\
>  												\
>  static inline void								\
>  cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
>  {												\
> -	object->state = CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
> +	object->ondemand->state = CACHEFILES_ONDEMAND_OBJSTATE_##_STATE; \
>  }

I wonder if those need barriers - smp_load_acquire() and smp_store_release().

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

