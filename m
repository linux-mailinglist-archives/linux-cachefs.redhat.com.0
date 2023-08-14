Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7036F77B8D0
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Aug 2023 14:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692016790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xm+QkUXW/IwtCnejGtoRFpr8XhYAfXIlLUoKuPQh/gk=;
	b=bfv4zD6OeaTgVFdRQBh0p4q67Q6fJYGeyyNZphgc+2drdf5azSmHfPLPq9R1TcSDMRK9VI
	pvcKf/JbYzSvUDUaCJrjaIS4W8aP/Ih/E4eZDRZzHW8SUZqkhWY3TfpmcRUu6Ka7J9TYEw
	csPp1Y01ujmD4QsGEdBKcG5VZlu2YHw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-afZjGJhzOeCFAddOcUjkgA-1; Mon, 14 Aug 2023 08:39:47 -0400
X-MC-Unique: afZjGJhzOeCFAddOcUjkgA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9859F3C15209;
	Mon, 14 Aug 2023 12:39:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 221064A9004;
	Mon, 14 Aug 2023 12:39:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D337194658D;
	Mon, 14 Aug 2023 12:39:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B3B61946586 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 14 Aug 2023 12:39:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B936140C2070; Mon, 14 Aug 2023 12:39:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CE1740C2063;
 Mon, 14 Aug 2023 12:39:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20230814093534.18278-1-guozihua@huawei.com>
References: <20230814093534.18278-1-guozihua@huawei.com>
To: GUO Zihua <guozihua@huawei.com>
MIME-Version: 1.0
Date: Mon, 14 Aug 2023 13:39:33 +0100
Message-ID: <4000876.1692016773@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH -next] fscache: Remove duplicated include
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <4000875.1692016773.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

GUO Zihua <guozihua@huawei.com> wrote:

> Remove duplicated include for linux/uio.h. Resolves checkincludes
> message.
> 
> Signed-off-by: GUO Zihua <guozihua@huawei.com>

Acked-by: David Howells <dhowells@redhat.com>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

