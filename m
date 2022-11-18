Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528D62EE0A
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Nov 2022 08:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668754862;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=plFCRaYq+SrYwJMyJCTT6oywcjTswySfiiyM7a/XDUM=;
	b=HQB8R0hiTI9ZScCoOQoLWJ6BSJ6BJfMP0B2Q4AfqauLaZeYcoECd2g7hDDQx5KvK2qbqHX
	SAGESHu3nXkdQbxiFxnlde3MTkqwXNi8d2BUyT9znJfISG9SHTfbMspf5Nn0LDPHxNjiLh
	mXat8Az25aHNDVopXgSYuaWIGMO9JGQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-x5lDnVVaNemrFAqJwBkXVg-1; Fri, 18 Nov 2022 02:01:00 -0500
X-MC-Unique: x5lDnVVaNemrFAqJwBkXVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 923541C06904;
	Fri, 18 Nov 2022 07:00:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 084A72027062;
	Fri, 18 Nov 2022 07:00:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BE8EB19465B8;
	Fri, 18 Nov 2022 07:00:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C39CC19465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 18 Nov 2022 07:00:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B15B6200A3AD; Fri, 18 Nov 2022 07:00:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FC7D2027062;
 Fri, 18 Nov 2022 07:00:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <54854a71-5856-f80f-d8cb-ab75b826ba5f@huawei.com>
References: <54854a71-5856-f80f-d8cb-ab75b826ba5f@huawei.com>
 <166869954095.3793579.8500020902371015443.stgit@warthog.procyon.org.uk>
To: "zhangpeng (AS)" <zhangpeng362@huawei.com>
MIME-Version: 1.0
Date: Fri, 18 Nov 2022 07:00:52 +0000
Message-ID: <4193090.1668754852@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH] fscache: fix OOB Read in
 __fscache_acquire_volume
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
Cc: lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 syzbot+a76f6a6e524cf2080aa3@syzkaller.appspotmail.com,
 linux-cachefs@redhat.com, v9fs-developer@lists.sourceforge.net
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <4193089.1668754852.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

zhangpeng (AS) <zhangpeng362@huawei.com> wrote:

> Thanks for your advice. The size needs to be able to hold up to 255 to
> handle larger keys. After testing, this patch works fine.

Can I put you down as a Reviewed-by or Tested-by?

Thanks,
David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

