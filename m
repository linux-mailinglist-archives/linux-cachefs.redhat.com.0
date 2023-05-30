Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 754B371653F
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 May 2023 16:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685458533;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vmZvWKVBb5pFnszd1BgAgM1FEuqLpPJk/LZZ7VoO0iQ=;
	b=QS8jX357Qq+W+rpyBi0+3+7eKnCTlg2HMoLVOxcVO2+7LAqVrIOVqpDVgP9ZO+tHNVo9HE
	6fkenLG2/JauU1fQOsQHQYBdngBGtja68+xc4L2tXKwAJCupg7ZtyK0MfulJk5Y7qcSS7a
	Li+gT8zikS2zTNSffkqmP2sZaODMvg0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-NklyxMhSNxaD62DxTSFYsA-1; Tue, 30 May 2023 10:55:29 -0400
X-MC-Unique: NklyxMhSNxaD62DxTSFYsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A6432800C21;
	Tue, 30 May 2023 14:55:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8AB22166B25;
	Tue, 30 May 2023 14:55:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ADB9C19465A8;
	Tue, 30 May 2023 14:55:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 63B431946595 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 30 May 2023 14:55:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5662A2166B26; Tue, 30 May 2023 14:55:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E2DF2166B25
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 14:55:28 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30FE7185A78B
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 14:55:28 +0000 (UTC)
Received: from sonic311-29.consmr.mail.ne1.yahoo.com
 (sonic311-29.consmr.mail.ne1.yahoo.com [66.163.188.210]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-393-YTPFSpZfNhSwY6NDI99jjg-1; Tue,
 30 May 2023 10:55:26 -0400
X-MC-Unique: YTPFSpZfNhSwY6NDI99jjg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1685458525; bh=JRffqSiaddwPHzLtZhi+d7gX3cU1Qd6YJ98ysTs7cXE=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=XNCxp3JEgtjDwJIsuTdV0pMcbKIRJm9sez1wDk1pfwidcsHPezRwDNg6IFzdTNsIHlwyZI2NUjverUp4DOTO2s3LBS9WR5LCT+HUhUSQk6GiowCz886Om+7uxOKftClnYppJOfO4QsvIOK8XmPStxt/zAhFCnGCjFXkLtmYYUa9eZoKxCZ9825cspmmj0f1RpupbR8/cMRN+FCXYioRbTWhGR2AUhak7A3winTg2lBI1BNWulPnsHR90vYPI0b3AOcRy5OF/gVMehdX3iUmXOE8JDTSDmuNp8nx6XacRAqqxEwV/kKeCsa8gGdBBX1yK/QIf0g+3jpqtCqnr6FVtPQ==
X-YMail-OSG: PzNVaEAVM1mpyU5BLfsxyoISExXNsM4jBEb_woBB1j8osNGXDQuf.hZybT1Xn2P
 V9YFwXoxyjLPK8e4KHNexzpsypsF9FQgyeRhptR_SqYsPQHDaVBlqBHhilcq5RJ8L68JVZf0mQVP
 187n63QyGURhs0SuOcHSgHiKV0TmymJUAXmlcTCl08fc.lLeUIxV4BCW8GNUc4LDaR2NQJA9vlac
 ww9JkF0omblWmsuvBDfINrCVzoLBzL4N4Qv3NVIfrdr7IlDFZgFv7c8Ni.9nZsE.MU_dO8QPrmwD
 UCC.qA7eXS8jBnHSHJTE8A9FK_YBzKK74JYkZrMpYGglQS4LwDk9bHDnZxiGhS1D1I7_dYQy3Cqv
 xD9CqAbBF2In7XbQsIT5txvs2gNd.NPHWsSDLloQjbajxLwrLMxVTowDhoKazgT5kMtsReb9O9ru
 MPIXtTr_hh02lsBKkRFI6M.UroUxcDBvZtOLL2STWWcc5lF59OhXSbO8d2oElbfbQH5KPKJ00KHT
 9d5DO5hjvplVsEvtNtbuoZdf67Yec9Fy2X66uoRjKSjblKPdJGq.Cxs5muifxGS7uw2EVdXafT2V
 wd4lLXhSUmKK0Ic2otH.VqCe4gozY2aa1AX59oOUApbCcd8jngfoZWdrlGiJDRxZFerEjt8XdsF7
 v5ttHl8scDpMmnZvNSqbTGAlOMZ.k7r0FBr9F2y62W.2TxA_8kry_5F9kCne4IUCnQeA3xqcG6Bq
 UDXmVTvXKUI2jUCCGUNsu6La_XZW3oN62LEYGCvesIBkjpStih_1jzyDnqMtD6L.5mbJ0MUU0Mra
 UuviewBleb5akzBcdFt5dmCmtQWblURPb0DVLDpJCpEFsDvh6OmIJa7GYDoKmuj_j.JcwPWsh66A
 WvMIV8VUSTH.T8zQ1sCh8kMayTv5WozGIU8vWu5pnJ5KpliEn8uboyPwfCdh5Sb2AGoLFC49vG2H
 InDojnIVzeuGQ77Jhmp0GdVw9fsnPRgqKIIRkVIlmaFxzu7Km5dIquu3e2v5geXsRlPfM3RLoKBr
 pHINLwQukWzaxjG1vP8tmLDSFb5eeRkX4VOKVvHUWcZfUTy3JafxKN7hIf9B8Uib2kTANBqu2VUR
 oTbLOZvt7zifYBfvMitVdbwDovvXBIR6FJuKM4ylH94Y119xbi6j_QpdBgIymthyjOhWjquGOZ3B
 RtBs7Jtv6cWIh4_Kp5xs.PNXlAqDhrcIgP2F_IakhSqa4UMtXJkLuHB.8_nbB5lbEHOm8xsJBPWO
 fm.kjO5AUuIM_GwtCxNditAkKl7D3WB1leZNj6pldnw861zIPGleIXrSks17fd19llYBeDB0RfcC
 f9Or5QkCQJfiiXJLfo2kzZpWNzzSlq_XMNTn7SVqqp3kxqYAWAEaOCK6DxV6n5jfbLcZL88_hecK
 a1sKHr_5W8.c0sjrWQCIRcsAoOD3dnRfWXpE7DqFtNSVvHAYMgdkjgMylKEtulnN32ywYshCnR7j
 Wk0m7hsjzivMRuTq5iXWt91a8u0WrvKDZGtlRVb6utuEvKfwKlv_MQB2ID5XdGj77PRslpKBsI66
 Em6LMY4AYJFhti3Z0ovDiRxfYiAU3W6cvkIWhys99LL4f3I3RSw4zyKMzByfzvqCWTWbsR6rs5yU
 jjQTDqcZ4xJ7vrMj_zj_21_i256bW1KbXfbPwDOTP6iPfMm9G3vOorJ.iRbiFEe5ixbkPOECROZU
 G8_FCVuell1PfWXTZD0oMTHi7kc7bM9usU1gEydwA6Hdcq98ZsYWsWaFnmOza1EjUpKSsbG8_1sb
 N1e1Gwv_cUHVLuHAimis7AJMPov18F1E4N1nxPvKYxgTFVmlu2zoZx6zvToMpbN_dJggld.GaSpB
 RPIxyhhfNKMvfR.dA9FI6QVjfV31F7hnIaktl8eVpocV6lmhtS78f9qqfDu9S7l.uSAMnWGs1NYc
 6GnYW0zWpkExywYBo_0QfWrywMqEl34cmY9IVU27UPPXvo7tKWluG2ausYFPNkMmkkODY8kUTBM.
 aUR3qxVJ15Upo2I0q6T_0aM0b5900q0FpeUkXAcyiRuIoHdxyIkj9Du4iJm97cTIWrgHLBBwYtWo
 cgdNj3yqnHEoIbUeEsqaDmuB0wCjZrfIgeE1NCfj_5pj4yDOz1DHITlHS.UT0Z2sUkLDh6c_Aqw1
 OiL0uy8eAeTPeT57e7d8f4DweRQ9IblcaodZ_Q8NxAiL3qfGPvVCVEovJdbLVcb0PxHj59cBXKrI
 JGv02PFcir5N6te2Js78kiDtZAESJYgmMexPYnECVFot5b3VfyyjW3MA-
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 1b869320-0869-4dfa-8b97-0be207cb43c7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Tue, 30 May 2023 14:55:25 +0000
Received: by hermes--production-gq1-6db989bfb-c6sbx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 59e7b2b9a557962954e0769a872227c3; 
 Tue, 30 May 2023 14:55:20 +0000 (UTC)
Message-ID: <301a58de-e03f-02fd-57c5-1267876eb2df@schaufler-ca.com>
Date: Tue, 30 May 2023 07:55:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
 <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
 <20230530142826.GA9376@lst.de>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20230530142826.GA9376@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH -next 0/2] lsm: Change inode_setattr()
 to take struct
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
Cc: mortonm@chromium.org, rafael@kernel.org, roberto.sassu@huawei.com,
 linux-unionfs@vger.kernel.org, linux-cifs@vger.kernel.org, paul@paul-moore.com,
 miklos@szeredi.hu, mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, tom@talpey.com,
 Casey Schaufler <casey@schaufler-ca.com>, wangweiyang2@huawei.com,
 viro@zeniv.linux.org.uk, dchinner@redhat.com,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>, eparis@parisplace.org,
 hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com, linux-nfs@vger.kernel.org,
 john.johansen@canonical.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: schaufler-ca.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/30/2023 7:28 AM, Christoph Hellwig wrote:
> On Tue, May 30, 2023 at 03:58:35PM +0200, Christian Brauner wrote:
>> The main concern which was expressed on other patchsets before is that
>> modifying inode operations to take struct path is not the way to go.
>> Passing struct path into individual filesystems is a clear layering
>> violation for most inode operations, sometimes downright not feasible,
>> and in general exposing struct vfsmount to filesystems is a hard no. At
>> least as far as I'm concerned.
> Agreed.  Passing struct path into random places is not how the VFS works.
>
>> So the best way to achieve the landlock goal might be to add new hooks
> What is "the landlock goal", and why does it matter?
>
>> or not. And we keep adding new LSMs without deprecating older ones (A
>> problem we also face in the fs layer.) and then they sit around but
>> still need to be taken into account when doing changes.
> Yes, I'm really worried about th amount of LSMs we have, and the weird
> things they do.

Which LSM(s) do you think ought to be deprecated? I only see one that I
might consider a candidate. As for weird behavior, that's what LSMs are
for, and the really weird ones proposed (e.g. pathname character set limitations)
(and excepting for BPF, of course) haven't gotten far.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

