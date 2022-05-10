Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF9B5215FE
	for <lists+linux-cachefs@lfdr.de>; Tue, 10 May 2022 14:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652187212;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2S+8LTwa2LrFaz3P/7Fi/mbiXihBagMx53mwKxecVkA=;
	b=Le0gl0LE2BBaLUjMRpSEGJjDpjSlnNw7Dr5+8foItY8MpsDBbHnQWPfAh+OR/KX0+RfMGh
	9pu1nSkNq5hjuz6I5bU5hfzAR2KOCe31aU318sD9aQiCTcU6XlHnvlzS9kRYxcQtGil9Ta
	GxHG0Qxmmk3jjS41WF5MhG5aVl1/eXM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-prN9M2OGNomSlCwEVVFyzQ-1; Tue, 10 May 2022 08:53:31 -0400
X-MC-Unique: prN9M2OGNomSlCwEVVFyzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE1003C213BB;
	Tue, 10 May 2022 12:53:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E448114C1D54;
	Tue, 10 May 2022 12:53:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AECAB194705D;
	Tue, 10 May 2022 12:53:22 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4346F1947052 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 10 May 2022 12:53:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F8CB40CFD29; Tue, 10 May 2022 12:53:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73CDB40CFD74;
 Tue, 10 May 2022 12:53:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220509074028.74954-4-jefflexu@linux.alibaba.com>
References: <20220509074028.74954-4-jefflexu@linux.alibaba.com>
 <20220509074028.74954-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Tue, 10 May 2022 13:53:18 +0100
Message-ID: <3509261.1652187198@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v11 03/22] cachefiles: unbind cachefiles
 gracefully in on-demand mode
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
Cc: zhujia.zj@bytedance.com, tianzichen@kuaishou.com,
 linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com, yinxin.x@bytedance.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3509260.1652187198.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Add a refcount to avoid the deadlock in on-demand read mode. The
> on-demand read mode will pin the corresponding cachefiles object for
> each anonymous fd. The cachefiles object is unpinned when the anonymous
> fd gets closed. When the user daemon exits and the fd of
> "/dev/cachefiles" device node gets closed, it will wait for all
> cahcefiles objects getting withdrawn. Then if there's any anonymous fd
> getting closed after the fd of the device node, the user daemon will
> hang forever, waiting for all objects getting withdrawn.
> 
> To fix this, add a refcount indicating if there's any object pinned by
> anonymous fds. The cachefiles cache gets unbound and withdrawn when the
> refcount is decreased to 0. It won't change the behaviour of the
> original mode, in which case the cachefiles cache gets unbound and
> withdrawn as long as the fd of the device node gets closed.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Acked-by: David Howells <dhowells@redhat.com>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

