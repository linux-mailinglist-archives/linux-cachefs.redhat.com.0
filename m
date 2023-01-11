Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD57666058
	for <lists+linux-cachefs@lfdr.de>; Wed, 11 Jan 2023 17:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673454307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o7YXMrMrxrww29N7DtTMgaxo8/Od7lFGCgzGTUKmjoo=;
	b=D74MNEaXKEsUYcW2j2HNX9RizrmkPNoeSdsegjN9uTO3MpVruzahdk6nxZL2cD7M/qyBMO
	4pC19u2kyqIlljapqPlO+A0P1nLhwgVIa1zJZw1kAFwPAdorwgof1zsJsYps15jjHtJGrR
	v/79dLWUVY2hWf9XQyXieQJK83V9WEA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-k02_mOK4M-GMFu5_MKkiVA-1; Wed, 11 Jan 2023 11:25:04 -0500
X-MC-Unique: k02_mOK4M-GMFu5_MKkiVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5B26380670A;
	Wed, 11 Jan 2023 16:25:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC9902026D68;
	Wed, 11 Jan 2023 16:25:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 66CEA19465B7;
	Wed, 11 Jan 2023 16:25:03 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9F17719465A3 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 16:25:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 81E4140C115E; Wed, 11 Jan 2023 16:25:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 626DE40C1060;
 Wed, 11 Jan 2023 16:25:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2431994.1673453386@warthog.procyon.org.uk>
References: <2431994.1673453386@warthog.procyon.org.uk>
 <20221226103309.953112-3-houtao@huaweicloud.com>
 <20221226103309.953112-1-houtao@huaweicloud.com>
MIME-Version: 1.0
Date: Wed, 11 Jan 2023 16:24:59 +0000
Message-ID: <2432456.1673454299@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v2 2/2] fscache: Add the missing
 smp_mb__after_atomic() before wake_up_bit()
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, houtao1@huawei.com, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-ID: <2432455.1673454299.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> What two values are you ordering?
> 
> If we're using this to create a critical section, then yes, we would need a
> barrier to order the changes inside the critical section before changing the
> memory location that forms the lock - but this is not a critical section.

Actually, that said, the ordering is probably between the bit being cleared
and the task state.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

