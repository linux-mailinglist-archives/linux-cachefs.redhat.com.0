Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B317D57D3E2
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Jul 2022 21:12:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658430761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eueajkkEd9IX2O3iL+kPyBdyfYJNJvrcQhhuLP5kZrg=;
	b=Zud4zrVEFfa7TEEiXLcTPUmZviKtMLdUONAV2JsI8EfdKGRXw8Fg0d0J1TWY8DKbnyTK0A
	av37cFQEENmIFEtI8IUMXl1ECqvRBEYkQxMJ9yYQDxR09YcFUEXhaCRwioUA9sB6JDm4Dl
	Owe4Kp5DBij78SMqxxAvBgoBxWUnnLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-44KYWeiaOuOHOgQ19kIjSQ-1; Thu, 21 Jul 2022 15:12:34 -0400
X-MC-Unique: 44KYWeiaOuOHOgQ19kIjSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54089811767;
	Thu, 21 Jul 2022 19:12:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 449DC1121315;
	Thu, 21 Jul 2022 19:12:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A83D194706D;
	Thu, 21 Jul 2022 19:12:33 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C0E361947049 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 19:12:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF7E9C28100; Thu, 21 Jul 2022 19:12:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB13FC27DB3
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 19:12:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9288885A585
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 19:12:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-o8Tp6i-KNcGpR0UZ_iow5A-1; Thu, 21 Jul 2022 15:12:28 -0400
X-MC-Unique: o8Tp6i-KNcGpR0UZ_iow5A-1
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oEb5k-00BVq1-CS; Thu, 21 Jul 2022 18:40:08 +0000
Message-ID: <6ca59494-cc64-d85c-98e8-e9bef2a04c15@infradead.org>
Date: Thu, 21 Jul 2022 11:40:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Jonathan Corbet <corbet@lwn.net>, Slark Xiao <slark_xiao@163.com>,
 kafai <kafai@fb.com>
References: <20220721015605.20651-1-slark_xiao@163.com>
 <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
 <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
 <874jzamhxe.fsf@meer.lwn.net>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <874jzamhxe.fsf@meer.lwn.net>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 7/21/22 11:36, Jonathan Corbet wrote:
> "Slark Xiao" <slark_xiao@163.com> writes:
> 
>> May I know the maintainer of one subsystem could merge the changes
>> contains lots of subsystem?  I also know this could be filtered by
>> grep and sed command, but that patch would have dozens of maintainers
>> and reviewers.
> 
> Certainly I don't think I can merge a patch touching 166 files across
> the tree.  This will need to be broken down by subsystem, and you may
> well find that there are some maintainers who don't want to deal with
> this type of minor fix.

We have also seen cases where "the the" should be replaced by "then the"
or some other pair of words, so some of these changes could fall into
that category.

-- 
~Randy

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

