Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 488EE4F370F
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Apr 2022 16:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649168059;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4v4w/PzqnsT64l8aQUBdq9vScctNbu4tM8o9XeMoQ54=;
	b=UaK/eqAPB/xVgoLlRQQUpVm1GAzamuT2zwRILWl6dEdTeLt52KUmRabz/OPmTcStTC7UX4
	TFPJN/9TpnWc0sLK3I1uxXn0IDz4Yf6hnSjPWdw7asrHLAvHiuIHKtxHluxg56Ewiq80gt
	W/eb7vplDri4FehOAg2jEcWm+l4homU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-Vmx5NuFGMU6jRDMgFajTHg-1; Tue, 05 Apr 2022 10:14:14 -0400
X-MC-Unique: Vmx5NuFGMU6jRDMgFajTHg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEB773C00122;
	Tue,  5 Apr 2022 14:14:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4CBE401E58;
	Tue,  5 Apr 2022 14:14:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B38E0194036C;
	Tue,  5 Apr 2022 14:14:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 45EF71947BBD for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Apr 2022 14:14:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0ACE240CF8FE; Tue,  5 Apr 2022 14:14:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32B6740CF8E5;
 Tue,  5 Apr 2022 14:14:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220405134649.6579-1-dwysocha@redhat.com>
References: <20220405134649.6579-1-dwysocha@redhat.com>
To: Dave Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Tue, 05 Apr 2022 15:14:10 +0100
Message-ID: <1788451.1649168050@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: Fix KASAN
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
Content-ID: <1788450.1649168050.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dave Wysochanski <dwysocha@redhat.com> wrote:

> @@ -203,7 +203,7 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
>  	if (!buf)
>  		return false;
>  	buf->reserved = cpu_to_be32(0);
> -	memcpy(buf->data, p, len);
> +	memcpy(buf->data, p, volume->vcookie->coherency_len);

Good catch.  However, I think it's probably better to change things a bit
further up, eg.:

	-	len += sizeof(*buf);
	-	buf = kmalloc(len, GFP_KERNEL);
	+	buf = kmalloc(sizeof(*buf) + len, GFP_KERNEL);

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

