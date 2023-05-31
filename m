Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0617187BA
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 May 2023 18:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685551571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9uP7MjqOrx7Ie5Qa+ZLtuemRwzugyL+ve/wiEa6HNQI=;
	b=L/bmEPvZzryqR26jmZzuDk2hvTdyhABhBPNSpipaMKwiu2RBw+iNTr44n20mCYY+7Pp6lA
	a0WcQeLWcTDIo1J/A43W0/0+WgV+m5lFmDDdQGWl45Srgvu9LGtZ9dHdiOcrTJ46muMphW
	p/y6oiJss4ky9iN9IrzBFTcMH4CHZ3k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-mZhVyq6iPBCZA4aTqL8ICA-1; Wed, 31 May 2023 12:46:08 -0400
X-MC-Unique: mZhVyq6iPBCZA4aTqL8ICA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23B5F185A794;
	Wed, 31 May 2023 16:46:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0832140E962;
	Wed, 31 May 2023 16:46:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9CB3F1946595;
	Wed, 31 May 2023 16:46:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1E8221946595 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 May 2023 16:45:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E4116421C5; Wed, 31 May 2023 16:45:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC30F421DF
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 16:45:08 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5A0B3C0F186
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 16:45:08 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
 (sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-insgOfZUMo21e8IQOgEwsw-1; Wed,
 31 May 2023 12:45:06 -0400
X-MC-Unique: insgOfZUMo21e8IQOgEwsw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1685551506; bh=IK4gslOeWW2xAgwNjF79sSMMDJ4aQyoyJI3YquDYDcv=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=jAWtEHJmvhubeBSmTqB0ckEPwUfFwywMKrCd0VAkbvfBOp93YxujbLeAq7uvJKzveVsUhcVLdoia1nkMTeFpwSXnKDVWGivZdQVzISUug+BmNDRPUf+pIOu4rcEvE2bc3IWJjDXrtGS/pu5BMyFaPlFbfHVq0iv6PYk2s9hIcpJE68x471JZk5aYw6l0wy0VfUqBXw/yoFTlxJA8u9WUgDAUhPGJu67B16gR8Ym35UbijnOSlYOlp0mnWyMC0SgSm0K/eHKWx+1wCNTy4lD0vw+nPAXLYoimbaUiQltt8nTub7zPY5Y1czAwbgVEyH9mJZ6HTY0j7Be3XTL6wP++Ww==
X-YMail-OSG: rgeBCO8VM1ljf.g_Q8Uu4HS_ZUmEYXBNHKGjxGFeFP1zXRQjSTRHN8nmK_t3Ghh
 KfhjA97dsyErTNGzb2iQztk4XpI4plX8XNrAM9thC2YfJ83o1aid48x._U7bunTfYF22kKAfC86W
 pihY_Kd_AyLJwDspxCPJU7x2yz6Ww9ihlzM29qBJ63SjoKTZMoHzAaplbCbm4ix2mQfQfzR4M920
 TyWSRXJMdI5n5hDGC4WPm46QEY0zMWUOgVAkv1yVHS9kr0jBsxYjfwqs1FqQJU0mSwU3r3m_S3ye
 W9b75yqfA_mLknagjX_06Tjd._CoGdRyAiHjWrEcw4OqtQrMgNoKzGoYSi9PA6P2T0juIEMrrEek
 POEaXorQr8gJx5A7beMneXZ1ih.9jrhQ9PvHAxIWqW9eWz.M_6J3ZYmXZATZ7ksh5vwsNazoWeqE
 yY.Ty3WvL5Zf2MlQznIP2TSj2MfQA2BmTcfk5TTE2avbQC_0.W_nU0QVd_5StTGkTPCEDw7CWpaa
 Rd6L1tEpfx0o4FbxX9KlTTpIE_WRy9SemfMaJ39rNImgHlaVkIgeRdtmaAYWHmps6ADiPPeRb1sj
 773B2oOSCpZLFC_3K7AbV9bVUTzw7RDe55huDpWRgH0VfNRsfy9VVaCXZzO5oq_oMBEJEMef.Pjd
 2.GBTxonfgA3Y.np5AlLKRhTwT27x4fzruG786POBZ6QKVABH_v3Br9DhyyNh1D_yjZ_r0WM4QJR
 _RDW2jmTf0HObbjk7TPtwNrqqssro74U5dMV5nzd2Cbbvp3iEAtoEVPJK1I.nuxOfclzgXyxyj_c
 Xtv5qfFFuoTxa0jltG0_UaJFQ0D8_LKbxouwaVfh.ctIpdnG3Z_DKw2OpOth2mbx6VD0UNjlj0cI
 EazCeFbKRuguPX7eriAEpskoijKQXxGUu0qDK_DNL78Y8bD2f8HHcQWv5j8w.WPWqiaeEyi_GxTm
 YV8iJNWiTmGZ_SVMoXv15wdu6hjFd5f1WHQm_YUCI1nFDFR_QxKQQuw5IjoahYzR3ceSoTJu1Iwv
 iAhpfvvK54RBlpWXMvIuJNATzocWolr9t_pGkYiUrLWuncaFTLyXoQ.Aue0Fin.vzak8DtIXEdCt
 _i5XWmii9RUS3jL_GP_BqVTMCs.Y_mXJ_8tja3pkJ_ZJmt_X2RhXvk.ESwiPwf_2mqh2WxAkBaF_
 KJ6JaIiZlZaqquJmnm3PPGo6WPHsAf.N_Rh_pqRfDJQJ77vFo4Ex9oHwUMSbN95_6zVRyhRiflOu
 RwXoe2AERVLwDLMO6tcpetSOd_IgxIWK2UsdacwFRAIAiHeeU884r5xawKwFWr9fMrNJ3fCPQpz4
 fycG7D2KCWT5OXkwcxCGCkuGpHLD5utT2PG03u9LlbghhwPp1IG5O6xCr3ZPgPyghmcffILr4IOY
 hhIkMqt9j6rfJo7n3rOTDtLGELjc2raiHXgWXIg8zrxD8HevT9I5asSxx.IjMSOmvAkO4gjfpkU0
 TEPNxxrg1Xuv_U3FzWXOEF3k89BlycgJxoIiesbWBqkV17mQ0o0yRprUkRalcJZPCY5IAE5tLuAH
 GDhm43aOVKDYCxheBAEvfhshOXFrGcm6zt7qT29jU_eIXQ9GQfb7xNagUvXF9Ip8Ci8TkypgtuZc
 C14rmtStFLdivkFGpfdqhJwkjw87fWA2oFdX4Obb7o5X0vBhQCRtpk..B5W.EIAhz4pCCQz.9EEc
 MqoMz09zaHaNEWt7lbgP1m5mW410HjMjZEVGenH0YAnqPwiK0gOKCdkooEo5CfhEXGCpoMxlfRSI
 Os90fZagiOU0drdy2ZNP.8xS7dmfucAua7BvBJ6UvuHppG0H_SYZ3VkZQJdb4HNNTAdY8PvbTK12
 rlicdSMQv7H9v1Z9fi3JS0A0qBn_tqeZwl1IE.kw2f0Z2S3EJjmpyTyBcaQw0XPQKcjN4nweAC7v
 MQrm6d3HfBoSSSlE_YPAjIlzmm4JqdSLxe8f8MCaB_Ku8c05QeX9c9FXOWbZZ.u5XmMakVwxASAS
 TQuIyQX2VYVmmTW65cIeY8vvon2waKKff61vGcEN3ugb_MOBh9bw3sJlYZBHS3GvYUSWzsknh9zG
 _3s0JVQ3HUG6iiUR2D4DPoDQCcQlti8UC2HfaOHbV_CPj4FU4NKySEsHMVNqNeT1OFgx7mp_LZLe
 gvtN5Hu5J_pGoqSx8rRAe5w4bdwf1j1hcey_2V2q_NJn3XgBFnd0IyHOlRwI1CcnZ37gJk6Yp8bq
 v8mlCiX1pVMEqWDZ6GdyHTPfotsvu2g1HCLei.KGpQQbiVMWnf5h0lI9u2Miuty4g
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 3dc95e55-b757-4320-819b-cea79f802ef0
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Wed, 31 May 2023 16:45:06 +0000
Received: by hermes--production-ne1-574d4b7954-xz2cn (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 803444bd8cafbcfff4fb75f278168acc; 
 Wed, 31 May 2023 16:45:02 +0000 (UTC)
Message-ID: <498f8719-219d-b4cf-8231-54d7fb6a58dd@schaufler-ca.com>
Date: Wed, 31 May 2023 09:44:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Christian Brauner <brauner@kernel.org>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
 <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
 <20230530142826.GA9376@lst.de>
 <301a58de-e03f-02fd-57c5-1267876eb2df@schaufler-ca.com>
 <20230530-tumult-adrenalin-8d48cb35d506@brauner>
 <28f3ca55-29ea-4582-655d-2769881127ad@schaufler-ca.com>
 <20230531-endpreis-gepflanzt-80a5a4a9c8d6@brauner>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20230531-endpreis-gepflanzt-80a5a4a9c8d6@brauner>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
 linux-unionfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-cifs@vger.kernel.org, paul@paul-moore.com, miklos@szeredi.hu,
 mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: schaufler-ca.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/31/2023 1:36 AM, Christian Brauner wrote:
> On Tue, May 30, 2023 at 03:15:01PM -0700, Casey Schaufler wrote:
>> On 5/30/2023 9:01 AM, Christian Brauner wrote:
>>> On Tue, May 30, 2023 at 07:55:17AM -0700, Casey Schaufler wrote:
>>>> On 5/30/2023 7:28 AM, Christoph Hellwig wrote:
>>>>> On Tue, May 30, 2023 at 03:58:35PM +0200, Christian Brauner wrote:
>>>>>> The main concern which was expressed on other patchsets before is that
>>>>>> modifying inode operations to take struct path is not the way to go.
>>>>>> Passing struct path into individual filesystems is a clear layering
>>>>>> violation for most inode operations, sometimes downright not feasible,
>>>>>> and in general exposing struct vfsmount to filesystems is a hard no. At
>>>>>> least as far as I'm concerned.
>>>>> Agreed.  Passing struct path into random places is not how the VFS works.
>>>>>
>>>>>> So the best way to achieve the landlock goal might be to add new hooks
>>>>> What is "the landlock goal", and why does it matter?
>>>>>
>>>>>> or not. And we keep adding new LSMs without deprecating older ones (A
>>>>>> problem we also face in the fs layer.) and then they sit around but
>>>>>> still need to be taken into account when doing changes.
>>>>> Yes, I'm really worried about th amount of LSMs we have, and the weird
>>>>> things they do.
>>>> Which LSM(s) do you think ought to be deprecated? I only see one that I
>>> I don't have a good insight into what LSMs are actively used or are
>>> effectively unused but I would be curious to hear what LSMs are
>>> considered actively used/maintained from the LSM maintainer's
>>> perspective.
>> I'm not the LSM maintainer, but I've been working on the infrastructure
>> for quite some time. All the existing LSMs save one can readily be associated
>> with active systems, and the one that isn't is actively maintained. We have
>> not gotten into the habit of accepting LSMs upstream that don't have a real
>> world use.
>>
>>>> might consider a candidate. As for weird behavior, that's what LSMs are
>>>> for, and the really weird ones proposed (e.g. pathname character set limitations)
>>> If this is effectively saying that LSMs are licensed to step outside the
>>> rules of the subsystem they're a guest in then it seems unlikely
>>> subsystems will be very excited to let new LSM changes go in important
>>> codepaths going forward. In fact this seems like a good argument against
>>> it.
>> This is an artifact of Linus' decision that security models should be
>> supported as add-on modules. On the one hand, all that a subsystem maintainer
>> needs to know about a security feature is what it needs in the way of hooks.
>> On the other hand, the subsystem maintainer loses control over what kinds of
>> things the security feature does with the available information. It's a
>> tension that we've had to deal with since the Orange Book days of the late
>> 1980's. The deal has always been:
>>
>> 	You can have your security feature if:
>> 	1. If I turn it off it has no performance impact
>> 	2. I don't have to do anything to maintain it
>> 	3. It doesn't interfere with any other system behavior
>> 	4. You'll leave me alone
>>
>> As a security developer from way back I would be delighted if maintainers of
>> other subsystems took an active interest in some of what we've been trying
>> to accomplish in the security space. If the VFS maintainers would like to
>> see the LSM interfaces for file systems changed I, for one, would like very
>> much to hear about what they'd prefer. 
> What is important for us is that the security layer must understand and
> accept that some things cannot be done the way it envisions them to be
> done because it would involve design compromises in the fs layer that
> the fs maintainers are unwilling to make. The idea to pass struct path
> to almost every security hook is a good example.

Yes, and that's completely acceptable. What would be really great is some
guidance about what to do instead. Fishing for NAKs isn't fun for anybody.

> If the project is feature parity between inode and path based LSMs then
> it must be clear from the start that this won't be achieved at the cost
> of mixing up the layer where only dentries and inodes are relevant and
> the layer where struct paths are most relevant.

Which is a fair point, and helps those of us who don't work in the VFS
layer daily understand the rationale.

>
>> We do a lot of crazy things to avoid interfering with the subsystems we
>> interact with. A closer developer relationship would be most welcome, so
>> long as it helps us achieve or goals. We get a lot of complaints about how
>> LSM feature perform, but no one wants to hear that a good deal of that comes
>> about because of what has to be done in support of 1, 2 and 3 above. Sometimes
>> we do stoopid things, but usually it's to avoid changes "outside our swim lane".
> I personally am not opposed to comment on patches but they will
> naturally have lower priority than other things.

I can't say that I see how security features "naturally have lower priority",
but everyone has to balance things.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

