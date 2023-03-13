Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EBB6B768F
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Mar 2023 12:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rgujdTi5y5QQyYstSUAjw87LvLfiJzudc5S3vKYVhBo=;
	b=b3Uqs0fXdP+3d579LrK0eoWLa0QneAPFxBst9KzMk35rqFe6MthYUzzSITnSspMOKUXwZv
	1o3ytD9oSKe+hzKcYoy2oTWEogbzt32xToSc2Bz/LoKwsQ7UmrVlTbXx1vXfVc3yV7/EF5
	wFJSMRKFdqR8xoelj5KAedXEMGCOgn8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-9PcibSvSMxODRmbAKCMjsw-1; Mon, 13 Mar 2023 07:49:14 -0400
X-MC-Unique: 9PcibSvSMxODRmbAKCMjsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B90C385A588;
	Mon, 13 Mar 2023 11:49:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 041871121315;
	Mon, 13 Mar 2023 11:49:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B89C719465A2;
	Mon, 13 Mar 2023 11:49:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EB5521946588 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 13 Mar 2023 11:49:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CAB2E400F51; Mon, 13 Mar 2023 11:49:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A2047507A
 for <linux-cachefs@redhat.com>; Mon, 13 Mar 2023 11:49:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 992953828882
 for <linux-cachefs@redhat.com>; Mon, 13 Mar 2023 11:49:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-wR_lkm43PmCoozm5x1EJnQ-1; Mon, 13 Mar 2023 07:48:56 -0400
X-MC-Unique: wR_lkm43PmCoozm5x1EJnQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 092D5B81049;
 Mon, 13 Mar 2023 11:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75CFC433D2;
 Mon, 13 Mar 2023 11:38:43 +0000 (UTC)
Date: Mon, 13 Mar 2023 12:38:40 +0100
From: Christian Brauner <brauner@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20230313113840.75eyj66ydgbvln6p@wittgenstein>
References: <20230310231206.3952808-1-mcgrof@kernel.org>
 <20230310231206.3952808-3-mcgrof@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230310231206.3952808-3-mcgrof@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH 2/5] devpts: simplify two-level sysctl
 registration for pty_kern_table
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
Cc: j.granados@samsung.com, jaharkes@cs.cmu.edu, keescook@chromium.org,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, codalist@coda.cs.cmu.edu, coda@cs.cmu.edu,
 linux-cachefs@redhat.com, ebiederm@xmission.com, jack@suse.com,
 linux-fsdevel@vger.kernel.org, yzaikin@google.com, anton@tuxera.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 10, 2023 at 03:12:03PM -0800, Luis Chamberlain wrote:
> There is no need to declare two tables to just create directories,
> this can be easily be done with a prefix path with register_sysctl().
> 
> Simplify this registration.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---

I can take this one, Luis. Thanks!

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

