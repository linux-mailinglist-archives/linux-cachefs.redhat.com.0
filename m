Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8C57D370
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Jul 2022 20:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658428650;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TuiVGwgdIyiPrBw4tePB74BK0lOVDsNgODoxeZ/cueQ=;
	b=hXDSWxQ3yArZjlVSQ3qzW9SwSEVvYdOACbEEn+BE89sM9saHOyEI/U0xXVIW5YXFP3GD8W
	AP2YZbMjnuXBcH68GIWRNkab/M9+31aJkO/5B8/Tl4HMNii1oxirqKoqeRI79kNKLm0kdg
	XKn0OLKSkw9vbezoIcpLfsMgzOEmbZw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-3gTJI7meNPGAf8LBOKRfOA-1; Thu, 21 Jul 2022 14:37:28 -0400
X-MC-Unique: 3gTJI7meNPGAf8LBOKRfOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 235711C14482;
	Thu, 21 Jul 2022 18:37:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5C492026D64;
	Thu, 21 Jul 2022 18:37:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A3111947053;
	Thu, 21 Jul 2022 18:37:25 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2F6BD1947077 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 18:37:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 127A890A00; Thu, 21 Jul 2022 18:37:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F04918ECB
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 18:37:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8C698001EA
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 18:37:22 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-qJF_Bs22OfSr6jolomps7Q-1; Thu, 21 Jul 2022 14:37:19 -0400
X-MC-Unique: qJF_Bs22OfSr6jolomps7Q-1
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 656C86D9;
 Thu, 21 Jul 2022 18:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 656C86D9
From: Jonathan Corbet <corbet@lwn.net>
To: Slark Xiao <slark_xiao@163.com>, kafai <kafai@fb.com>
In-Reply-To: <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
References: <20220721015605.20651-1-slark_xiao@163.com>
 <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
 <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
Date: Thu, 21 Jul 2022 12:36:45 -0600
Message-ID: <874jzamhxe.fsf@meer.lwn.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH v2] docs: Fix typo in comment
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
Cc: linux-cachefs <linux-cachefs@redhat.com>,
 linux-doc <linux-doc@vger.kernel.org>, peterz <peterz@infradead.org>,
 bigeasy <bigeasy@linutronix.de>, ast <ast@kernel.org>, song <song@kernel.org>,
 sdf <sdf@google.com>, will <will@kernel.org>, Baoquan He <bhe@redhat.com>,
 "william.gray" <william.gray@linaro.org>,
 "john.fastabend" <john.fastabend@gmail.com>, andrii <andrii@kernel.org>,
 mingo <mingo@redhat.com>, longman <longman@redhat.com>,
 dyoung <dyoung@redhat.com>, vgoyal <vgoyal@redhat.com>,
 "boqun.feng" <boqun.feng@gmail.com>, kpsingh <kpsingh@kernel.org>,
 yhs <yhs@fb.com>, tglx <tglx@linutronix.de>, haoluo <haoluo@google.com>,
 daniel <daniel@iogearbox.net>, kexec <kexec@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, jolsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, "martin.lau" <martin.lau@linux.dev>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

"Slark Xiao" <slark_xiao@163.com> writes:

> May I know the maintainer of one subsystem could merge the changes
> contains lots of subsystem?  I also know this could be filtered by
> grep and sed command, but that patch would have dozens of maintainers
> and reviewers.

Certainly I don't think I can merge a patch touching 166 files across
the tree.  This will need to be broken down by subsystem, and you may
well find that there are some maintainers who don't want to deal with
this type of minor fix.

Thanks,

jon

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

