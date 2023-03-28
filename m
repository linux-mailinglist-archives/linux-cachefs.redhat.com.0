Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D761D6CC16A
	for <lists+linux-cachefs@lfdr.de>; Tue, 28 Mar 2023 15:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680011546;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I8XeWgzTB+7nDrQkoQH8lMWl6WmmfGw5EuEaB20BBHk=;
	b=JuKcjZNoDlY8DXTv5e0cPEzBQ7XNNY7t6tS1UlMIjSilK6oqC+wql7KWz5CsPnxdc5vJvZ
	UdXUx0N38u0fFm8DMO+LL3L54MrsAraVZGBjuo2LZqOz7ktW7m17AtmsNqjBDYZThD35o1
	S4uViQ1RY6coBE2wNOzQdX/AdycTYF4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-O5KSYYy0PtWkgUjlInhd9Q-1; Tue, 28 Mar 2023 09:52:23 -0400
X-MC-Unique: O5KSYYy0PtWkgUjlInhd9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8F123C10145;
	Tue, 28 Mar 2023 13:52:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B587C4042AC0;
	Tue, 28 Mar 2023 13:52:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 02C00194658F;
	Tue, 28 Mar 2023 13:52:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 995701946589 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 28 Mar 2023 13:52:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7D4F414171BC; Tue, 28 Mar 2023 13:52:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E09614171BB;
 Tue, 28 Mar 2023 13:52:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20230111052515.53941-2-zhujia.zj@bytedance.com>
References: <20230111052515.53941-2-zhujia.zj@bytedance.com>
 <20230111052515.53941-1-zhujia.zj@bytedance.com>
To: Jia Zhu <zhujia.zj@bytedance.com>
MIME-Version: 1.0
Date: Tue, 28 Mar 2023 14:52:11 +0100
Message-ID: <131869.1680011531@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH V4 1/5] cachefiles: introduce object
 ondemand state
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
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <131868.1680011531.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jia Zhu <zhujia.zj@bytedance.com> wrote:

> +enum cachefiles_object_state {
> +	CACHEFILES_ONDEMAND_OBJSTATE_close, /* Anonymous fd closed by daemon or initial state */
> +	CACHEFILES_ONDEMAND_OBJSTATE_open, /* Anonymous fd associated with object is available */

That looks weird.  Maybe make them all-lowercase?

> @@ -296,6 +302,21 @@ extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
>  extern int cachefiles_ondemand_read(struct cachefiles_object *object,
>  				    loff_t pos, size_t len);
>  
> +#define CACHEFILES_OBJECT_STATE_FUNCS(_state)	\
> +static inline bool								\
> +cachefiles_ondemand_object_is_##_state(const struct cachefiles_object *object) \
> +{												\
> +	return object->state == CACHEFILES_ONDEMAND_OBJSTATE_##_state; \
> +}												\
> +												\
> +static inline void								\
> +cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
> +{												\
> +	object->state = CACHEFILES_ONDEMAND_OBJSTATE_##_state; \
> +}
> +
> +CACHEFILES_OBJECT_STATE_FUNCS(open);
> +CACHEFILES_OBJECT_STATE_FUNCS(close);

Or just get rid of the macroisation?  If there are only two states, it doesn't
save you that much and it means that "make TAGS" won't generate refs for those
functions and grep won't find them.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

