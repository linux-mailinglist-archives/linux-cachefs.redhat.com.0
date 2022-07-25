Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4731A5804D2
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 21:52:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658778763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8KLc8duQUNKjVmZKaBF44bqlsY4Tv2RS5/GKNb52rR8=;
	b=E1NeMfTCP8B3HBrZgbKwcL1gsCQyp5lkpLMIY6n0whGIWvyFglo8kW8IFamJ0o3prF7Ok3
	5wLAoa6HlTejEorlHYuL733CmALg/vGT/KFXGecrThyDA3yQGfgIiLkZhMViR/bH/7paJe
	NMUXScIuy7htxF7gk7elHdSDOd9L80A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-kqA2vKF8M0GfRrMM3cA8jw-1; Mon, 25 Jul 2022 15:52:37 -0400
X-MC-Unique: kqA2vKF8M0GfRrMM3cA8jw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0BCE85A587;
	Mon, 25 Jul 2022 19:52:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3927E2026D64;
	Mon, 25 Jul 2022 19:52:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0B59D1945D89;
	Mon, 25 Jul 2022 19:52:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C385E1945D83 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 19:52:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A2243401E5C; Mon, 25 Jul 2022 19:52:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EA78492C3B
 for <linux-cachefs@redhat.com>; Mon, 25 Jul 2022 19:52:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84EEE802D2C
 for <linux-cachefs@redhat.com>; Mon, 25 Jul 2022 19:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-JL_N0_awMNeRg6K1lvH1Hg-1; Mon, 25 Jul 2022 15:52:31 -0400
X-MC-Unique: JL_N0_awMNeRg6K1lvH1Hg-1
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oG47s-001ATt-W2; Mon, 25 Jul 2022 19:52:25 +0000
Message-ID: <d146f3d6-9b2a-5b54-4ae3-733047ef210e@infradead.org>
Date: Mon, 25 Jul 2022 12:52:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: William Breathitt Gray <william.gray@linaro.org>,
 Joe Perches <joe@perches.com>
References: <20220721015605.20651-1-slark_xiao@163.com>
 <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
 <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
 <874jzamhxe.fsf@meer.lwn.net>
 <6ca59494-cc64-d85c-98e8-e9bef2a04c15@infradead.org>
 <YtnlAg6Qhf7fwXXW@MiWiFi-R3L-srv>
 <5bd85a7241e6ccac7fe5647cb9cf7ef22b228943.camel@perches.com>
 <Yt6hMD+HIaERgrqg@fedora>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <Yt6hMD+HIaERgrqg@fedora>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
 sdf <sdf@google.com>, will <will@kernel.org>, daniel <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, "john.fastabend" <john.fastabend@gmail.com>,
 andrii <andrii@kernel.org>, mingo <mingo@redhat.com>,
 longman <longman@redhat.com>, dyoung <dyoung@redhat.com>,
 vgoyal <vgoyal@redhat.com>, "boqun.feng" <boqun.feng@gmail.com>,
 kpsingh <kpsingh@kernel.org>, Slark Xiao <slark_xiao@163.com>,
 yhs <yhs@fb.com>, tglx <tglx@linutronix.de>, haoluo <haoluo@google.com>,
 Baoquan He <bhe@redhat.com>, kexec <kexec@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, jolsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, "martin.lau" <martin.lau@linux.dev>,
 kafai <kafai@fb.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 7/25/22 06:57, William Breathitt Gray wrote:
> On Mon, Jul 25, 2022 at 06:52:15AM -0700, Joe Perches wrote:
>> On Fri, 2022-07-22 at 07:45 +0800, Baoquan He wrote:
>>> On 07/21/22 at 11:40am, Randy Dunlap wrote:
>>>> On 7/21/22 11:36, Jonathan Corbet wrote:
>>>>> "Slark Xiao" <slark_xiao@163.com> writes:
>>>>>> May I know the maintainer of one subsystem could merge the changes
>>>>>> contains lots of subsystem?  I also know this could be filtered by
>>>>>> grep and sed command, but that patch would have dozens of maintainers
>>>>>> and reviewers.
>>>>>
>>>>> Certainly I don't think I can merge a patch touching 166 files across
>>>>> the tree.  This will need to be broken down by subsystem, and you may
>>>>> well find that there are some maintainers who don't want to deal with
>>>>> this type of minor fix.
>>>>
>>>> We have also seen cases where "the the" should be replaced by "then the"
>>>> or some other pair of words, so some of these changes could fall into
>>>> that category.
>>>
>>> It's possible. I searched in Documentation and went through each place,
>>> seems no typo of "then the". Below patch should clean up all the 'the the'
>>> typo under Documentation.
>> []
>>> The fix is done with below command:
>>> sed -i "s/the the /the /g" `git grep -l "the the " Documentation`
>>
>> This command misses entries at EOL:
>>
>> Documentation/trace/histogram.rst:  Here's an example where we use a compound key composed of the the
>>
>> Perhaps a better conversion would be 's/\bthe the\b/the/g'
> 
> It would be good to check for instances that cross newlines as well;
> i.e. "the" at the end of a line followed by "the" at the start of the
> next line. However, this would require some thought to properly account
> for comment blocks ("*") and other similar prefixes that should be
> ignored.

Yeah, the script that I posted last year (?) does that, but it's noisy --
results need to be hand-checked.

It's not clear how people are finding these repeated words, other than
something like
$ grep "the the" *


-- 
~Randy

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

