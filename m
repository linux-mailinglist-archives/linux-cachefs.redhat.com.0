Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D50D614098
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Oct 2022 23:22:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667254968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uN5Ma8hrmHJBUBGjUWnvuDMJ/5CQJwa6sU5OeB6rPWo=;
	b=RBpTx09TweQCnACBLqXD4DOK25cgAaZtsJldhb5ppWxqwbQkMsYxg2uHQCzoYn5k08Ms+G
	X6kY+3dIOU+mz+224yuf6PyGqIgR44OKoQ6LN1EVrbL1IxUZiGDgEwxGXuv5Uv0/odg+sA
	V5cCSOvni3Ecr95rdl5kupoJzdrXDKQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-iPFwl-AgMGu1tKt29ZnetA-1; Mon, 31 Oct 2022 18:22:45 -0400
X-MC-Unique: iPFwl-AgMGu1tKt29ZnetA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFBF13817963;
	Mon, 31 Oct 2022 22:22:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D39EC111E3E4;
	Mon, 31 Oct 2022 22:22:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 89E371946595;
	Mon, 31 Oct 2022 22:22:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BB783194658C for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 31 Oct 2022 22:22:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9AFB02028DC1; Mon, 31 Oct 2022 22:22:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90DFD2028CE4
 for <linux-cachefs@redhat.com>; Mon, 31 Oct 2022 22:22:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49EAF29ABA0B
 for <linux-cachefs@redhat.com>; Mon, 31 Oct 2022 22:22:41 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2130.outbound.protection.outlook.com [40.107.220.130]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-sRFhyJekNPu7H7RCLxRqOQ-1; Mon, 31 Oct 2022 18:22:38 -0400
X-MC-Unique: sRFhyJekNPu7H7RCLxRqOQ-1
Received: from CH0PR13MB5084.namprd13.prod.outlook.com (2603:10b6:610:111::7)
 by SJ0PR13MB5336.namprd13.prod.outlook.com (2603:10b6:a03:3e2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.9; Mon, 31 Oct
 2022 22:22:32 +0000
Received: from CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::9927:a5a2:43a2:4801]) by CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::9927:a5a2:43a2:4801%4]) with mapi id 15.20.5791.010; Mon, 31 Oct 2022
 22:22:31 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: David Wysochanski <dwysocha@redhat.com>
Thread-Topic: [PATCH v9 3/5] NFS: Convert buffered read paths to use netfs
 when fscache is enabled
Thread-Index: AQHY4haQkoBmSzNGnUKjxd6S65UEnK4irO+AgAEVtACAAFZkAIABjseAgAIB0ICAAYCRAA==
Date: Mon, 31 Oct 2022 22:22:31 +0000
Message-ID: <1B2E1442-EB0A-43E3-96BB-15C717E966E5@hammerspace.com>
References: <20221017105212.77588-1-dwysocha@redhat.com>
 <20221017105212.77588-4-dwysocha@redhat.com>
 <870684b35a45b94c426554a62b63f80f421dbb08.camel@kernel.org>
 <CALF+zOm+-2QLOMu4J7NAK++xfjZ8SQqmMh8zNFcM2H78_qYAzA@mail.gmail.com>
 <0676ecb2bb708e6fc29dbbe6b44551d6a0d021dc.camel@kernel.org>
 <CALF+zOnRH_GiZooiNm1=J+gOpLMEncO72SA4jAmL+agG9RjbYg@mail.gmail.com>
 <CALF+zOmDzp-UhLC0Dk4fmsjEzWgM75m5uOMBjv6TjTFYtbWPAQ@mail.gmail.com>
In-Reply-To: <CALF+zOmDzp-UhLC0Dk4fmsjEzWgM75m5uOMBjv6TjTFYtbWPAQ@mail.gmail.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR13MB5084:EE_|SJ0PR13MB5336:EE_
x-ms-office365-filtering-correlation-id: f79f498a-e2ac-40d8-e72b-08dabb8e673f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: sFdIDeBnxd/a28URQiCuXd/mf79MTZAgqxobxiobQv+HSeiSkfVnVMRu8ONPQ+Mt/X79xQGyHXOUoEh25v3hbkBJd6XeNSyb+QRfazaIkTKZ8zCdR5HRDHHPHpncrbCiOeD+zwBb2uUygud0A4Ypc6yF8BybBHki00ua4w6dwSBmQMUUd8LR0pURSJY016Eo8VtKHd2cOqgoe1YEtADIFCsi7ODWKkbWrIFLLGF6IJVk1VFkhdso2mIGN2zHXSj/8UMKcYybaHlSLjtbVRYomAqFoJiAq5JG2hu7G+dRR7IYUwRtkp7aC6Sfv5OxuY+aMnYE40Uskfj7TlvNCZ6cFgNd+qs3YUFTOHlfyHwGExj080xH9J5mlyc9dP0TexzlpNiUGDV9O9LyRatHJglMazaELMb12OLFA5cJJK8txpQ5HZkergay5SKzt/TYJ6ZKAzECbm/pQ4VXd83DYK11Ky8F8xcQlETCgOEZ+0Rym+OleEMlqTB59sTVHoaBWVzTd29OuJtjELUVfPjeN9sN1GFJIsF+1cHYvu56mBENZWdXvtDEEat1gDZbcSUIjjLLKoPmi95qzJvTFicFu1/TY72xmcAjQwaTwlSkkBd/4xV7sTv4kKHTbDTwpcBG0zOi5X8xkgES3tsDilPE/qmzRBoH2jBoQ3y7lH5kYwqmlefK+PgVDtHG3TFJobvp8YroOXehuyHOM9Oktzh10BxEinnp08SOd3KkW+t/2uWDSEbwNBOQUIDOmbfpxQFOwQT1eHOSiQz8MSYnpIWCrrsuCyKNY9odSEY7X7sLGAsWwq32NROc3Epu6zhuQ2YRXoyKiC6v1sHZKuROHJ27X7/P9ZVwdkQvpwF14zFa0FQi8O6oINgTeovYSKgCyusPb05C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR13MB5084.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(136003)(39840400004)(396003)(376002)(451199015)(6506007)(6512007)(53546011)(2616005)(36756003)(26005)(6486002)(478600001)(2906002)(166002)(4001150100001)(71200400001)(38070700005)(122000001)(99936003)(38100700002)(86362001)(83380400001)(186003)(6916009)(33656002)(5660300002)(8676002)(4326008)(41300700001)(316002)(76116006)(66476007)(66899015)(66556008)(66446008)(8936002)(54906003)(66946007)(64756008)(30864003)(45980500001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mgARQdJdZ6TJ13g1jdtAu6mLzXsVI2EkaZt1bCfD1EBRGLXjmFqpHq+z4PHO?=
 =?us-ascii?Q?aSG01CxLzPQB/JyQhAZrWyqIn3WJv/e/YMuREo5CyVbTr6d5Im/JXGQm05me?=
 =?us-ascii?Q?SnN4/7hXOj3f5M4BeJ+xzRRHA7TnvoQnO1YBNdj3/eDGAIoIoe5U5NHDn3aw?=
 =?us-ascii?Q?GZ8tSqHcaChQasKBFhF93zrDoeLbSvHYEe5T5x6YfbFTnZ+Mg8k4UC5zFOpc?=
 =?us-ascii?Q?j8pue0HutAqmhQsnsPYks0HNcs+ZPYdcknUj4LLk7UMWlOXw5zPRKNZYo3Cw?=
 =?us-ascii?Q?gNxdhQEbI1NCNA4XydGhyAej2WBzBL+qlRcquwpullc1QMPcjcZ7/Rz9+AWx?=
 =?us-ascii?Q?GYiCPqm+m2swT9mNk7aTEQp5k+rtGdPy0fDGgQDMqU763E3wvpLctTncrn9L?=
 =?us-ascii?Q?OmcxDnlIyxWkZEsDMXQNTo1/mlTAvULGGx0M1RjoKCcZ6oE9zfPRo8Y1ySs6?=
 =?us-ascii?Q?34ikBGQZrUic6pJQrWNIANWuR561/CzeQSoZBvrpNU6YaFPFU/2ATZkniVFB?=
 =?us-ascii?Q?cGJbmQFV2VHeMNoNE924lOgVYJkQ5GqCJuf0wgGhu6LLhpN8Pz030hymVsMq?=
 =?us-ascii?Q?ul0ncDbhA4VpewWUNTX1UgRIRpCGGhTYgiXBM67ipAPMsgeCTlGPJyWwe9oP?=
 =?us-ascii?Q?nSZnRsHhtPcPAGMi6DyqoN+9/rT/6LJqRx+8Ktrf3s+4dJN8bg8VSv3WMFuK?=
 =?us-ascii?Q?qLg4ompyNqg8Qh5qxfqfFJzJ/74t26SCSnX3iBZF8WgBnFtorsZDNsZVASId?=
 =?us-ascii?Q?Ivr/hNyX5hE7+jM2evj2od/TjH+jOMo2F7LY8o0X3RHTrij6loxQeyYyoVtg?=
 =?us-ascii?Q?SeYnFLVCy929nILssVSdoSZ0NqAi52nbTcddJM4PDSmNQ92y/I1x5TUfCpLl?=
 =?us-ascii?Q?HcTocAAl2Vgsw+4kWULehGGQlPHIi60G/qJm6LWPIHIoGXBwYFuaSn4Ha0bX?=
 =?us-ascii?Q?QJ3kDRIj5MrHr5bVzxITSVvHo0GOv0Wp/4QzfcWUinQWelUjcjl/pHMlZKSk?=
 =?us-ascii?Q?8f1LpEArY1V30O7mJlrewlWVQvTjX3pZnn9bIG51QtprHSEelle0JEIVrBEo?=
 =?us-ascii?Q?yPb2Xuffi1vsOpgoLULD0HKMt2CZtU9uKDznpIVGZsuKJpLxvLFy5qR16ez+?=
 =?us-ascii?Q?1HxH4ldShVHCxKeAL9sG9eP9ptAGGGgDxfcHFF1WH1LJDo7dX+ex66eRZQ6z?=
 =?us-ascii?Q?CHTlAHzuL9Y+bWUkzpMXqLFHVvAFNZIJ/3/wJxlMF9bqKLkfbH3+UyKMOPoZ?=
 =?us-ascii?Q?DQUUDZZGd19iVJI6WcHAPhDOEruZSYFwJ2+gAREePpX6x3B39hdPQzhByEmn?=
 =?us-ascii?Q?0BuvkE4YVJEUwowYfkFL3OEWkTVF10d6+vNs3WdYpE0Gd7m9LaXb3pXPjSyB?=
 =?us-ascii?Q?xpqr7iz78ogSJepaok7ZhzWZNH4Hjcg1CTz4iO2LXYMN+vVFJqqPQTncb7Sm?=
 =?us-ascii?Q?ueuiELuZ2s0tvSSUl59SuPh+1NHvOgrO/QcPGlIpWqj+kctvsRlgGHBBkShd?=
 =?us-ascii?Q?/4DkT3FB3Kwk+4UloHqILap3OnJhfiyGD89RrEZQwwW0UsZDQWSPjI7Ths5p?=
 =?us-ascii?Q?8Yd4vH48rwKmSIO8PIxFE4yubvqkv2ryHOQrRYN1N6y8ryVV3eOtLhPA4xIH?=
 =?us-ascii?Q?oQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR13MB5084.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79f498a-e2ac-40d8-e72b-08dabb8e673f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2022 22:22:31.7869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tgM77rNQPRNTryHJiDRgIkSUjQruda4eoe7jtMO124Xax/UC0kY52mcSO3q8yFYfjxkOAC6pAhsep+rH/oYaLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR13MB5336
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [Linux-cachefs] [PATCH v9 3/5] NFS: Convert buffered read paths
 to use netfs when fscache is enabled
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 Benjamin Maynard <benmaynard@google.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trondmy@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============2498226016456158712=="

--===============2498226016456158712==
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_1B2E1442EB0A43E396BB15C717E966E5hammerspacecom_";
	type="multipart/alternative"

--_004_1B2E1442EB0A43E396BB15C717E966E5hammerspacecom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> On Oct 30, 2022, at 19:25, David Wysochanski <dwysocha@redhat.com> wrote:
>
> On Sat, Oct 29, 2022 at 12:46 PM David Wysochanski <dwysocha@redhat.com> =
wrote:
>>
>> On Fri, Oct 28, 2022 at 12:59 PM Trond Myklebust <trondmy@kernel.org> wr=
ote:
>>>
>>> On Fri, 2022-10-28 at 07:50 -0400, David Wysochanski wrote:
>>>> On Thu, Oct 27, 2022 at 3:16 PM Trond Myklebust <trondmy@kernel.org>
>>>> wrote:
>>>>>
>>>>> On Mon, 2022-10-17 at 06:52 -0400, Dave Wysochanski wrote:
>>>>>> Convert the NFS buffered read code paths to corresponding netfs
>>>>>> APIs,
>>>>>> but only when fscache is configured and enabled.
>>>>>>
>>>>>> The netfs API defines struct netfs_request_ops which must be
>>>>>> filled
>>>>>> in by the network filesystem.  For NFS, we only need to define 5
>>>>>> of
>>>>>> the functions, the main one being the issue_read() function.
>>>>>> The issue_read() function is called by the netfs layer when a
>>>>>> read
>>>>>> cannot be fulfilled locally, and must be sent to the server
>>>>>> (either
>>>>>> the cache is not active, or it is active but the data is not
>>>>>> available).
>>>>>> Once the read from the server is complete, netfs requires a call
>>>>>> to
>>>>>> netfs_subreq_terminated() which conveys either how many bytes
>>>>>> were
>>>>>> read
>>>>>> successfully, or an error.  Note that issue_read() is called with
>>>>>> a
>>>>>> structure, netfs_io_subrequest, which defines the IO requested,
>>>>>> and
>>>>>> contains a start and a length (both in bytes), and assumes the
>>>>>> underlying
>>>>>> netfs will return a either an error on the whole region, or the
>>>>>> number
>>>>>> of bytes successfully read.
>>>>>>
>>>>>> The NFS IO path is page based and the main APIs are the pgio APIs
>>>>>> defined
>>>>>> in pagelist.c.  For the pgio APIs, there is no way for the caller
>>>>>> to
>>>>>> know how many RPCs will be sent and how the pages will be broken
>>>>>> up
>>>>>> into underlying RPCs, each of which will have their own
>>>>>> completion
>>>>>> and
>>>>>> return code.  In contrast, netfs is subrequest based, a single
>>>>>> subrequest may contain multiple pages, and a single subrequest is
>>>>>> initiated with issue_read() and terminated with
>>>>>> netfs_subreq_terminated().
>>>>>> Thus, to utilze the netfs APIs, NFS needs some way to accommodate
>>>>>> the netfs API requirement on the single response to the whole
>>>>>> subrequest, while also minimizing disruptive changes to the NFS
>>>>>> pgio layer.
>>>>>>
>>>>>> The approach taken with this patch is to allocate a small
>>>>>> structure
>>>>>> for each nfs_netfs_issue_read() call, store the final error and
>>>>>> number
>>>>>> of bytes successfully transferred in the structure, and update
>>>>>> these
>>>>>> values
>>>>>> as each RPC completes.  The refcount on the structure is used as
>>>>>> a
>>>>>> marker
>>>>>> for the last RPC completion, is incremented in
>>>>>> nfs_netfs_read_initiate(),
>>>>>> and decremented inside nfs_netfs_read_completion(), when a
>>>>>> nfs_pgio_header
>>>>>> contains a valid pointer to the data.  On the final put (which
>>>>>> signals
>>>>>> the final outstanding RPC is complete) in
>>>>>> nfs_netfs_read_completion(),
>>>>>> call netfs_subreq_terminated() with either the final error value
>>>>>> (if
>>>>>> one or more READs complete with an error) or the number of bytes
>>>>>> successfully transferred (if all RPCs complete successfully).
>>>>>> Note
>>>>>> that when all RPCs complete successfully, the number of bytes
>>>>>> transferred
>>>>>> is capped to the length of the subrequest.  Capping the
>>>>>> transferred
>>>>>> length
>>>>>> to the subrequest length prevents "Subreq overread" warnings from
>>>>>> netfs.
>>>>>> This is due to the "aligned_len" in nfs_pageio_add_page(), and
>>>>>> the
>>>>>> corner case where NFS requests a full page at the end of the
>>>>>> file,
>>>>>> even when i_size reflects only a partial page (NFS overread).
>>>>>>
>>>>>> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
>>>>>> Reviewed-by: Jeff Layton <jlayton@kernel.org>
>>>>>
>>>>>
>>>>> This is not doing what I asked for, which was to separate out the
>>>>> fscache functionality, so that we can call that if and when it is
>>>>> available.
>>>>>
>>>> I must have misunderstood then.
>>>>
>>>> The last feedback I have from you was that you wanted it to be
>>>> an opt-in feature, and it was a comment on a previous patch
>>>> to Kconfig.  I was proceeding the best I knew how, but
>>>> let me try to get back on track.
>>>>
>>>>> Instead, it is just wrapping the NFS requests inside netfs
>>>>> requests. As
>>>>> it stands, that means it is just duplicating information, and
>>>>> adding
>>>>> unnecessary overhead to the standard I/O path (extra allocations,
>>>>> extra
>>>>> indirect calls, and extra bloat to the inode).
>>>>>
>>>> I think I understand what you're saying but I'm not sure.  Let me
>>>> ask some clarifying questions.
>>>>
>>>> Are you objecting to the code when CONFIG_NFS_FSCACHE is
>>>> configured?  Or when it is not?  Or both?  I think you're objecting
>>>> when it's configured, but not enabled (we mount without 'fsc').
>>>> Am I right?
>>>>
>>>> Also, are you objecting to the design that to use fcache we now
>>>> have to use netfs, specifically:
>>>> - call into netfs via either netfs_read_folio or netfs_readahead
>>>> - if fscache is enabled, then the IO can be satisfied from fscache
>>>> - if fscache is not enabled, or some of the IO cannot be satisfied
>>>> from the cache, then NFS is called back via netfs_issue_read
>>>> and we use the normal NFS read pageio interface.  This requires
>>>> we call netfs_subreq_terminated() when all the RPCs complete,
>>>> which is the reason for the small changes to pagelist.c
>>>
>>> I'm objecting to any middle layer "solution" that adds overhead to the
>>> NFS I/O paths.
>>>
>> Got it.
>>
>>> I'm willing to consider solutions that are specific only to the fscache
>>> use case (i.e. when the 'fsc' mount option is specified). However when
>>> I perform a normal NFS mount, and do I/O, then I don't want to see
>>> extra memory allocations, extra indirect calls and larger inode
>>> footprints.
>>>
>>> IOW: I want the code to optimise for the case of standard NFS, not for
>>> the case of 'NFS with cachefs additions'.
>>>
>> I agree completely.  Are you seeing extra memory allocations
>> happen on mounts without 'fsc' or is it more a concern or how
>> some of the patches look?  We should not be calling any netfs or
>> fscache code if 'fsc' is not on the mount and I don't see any in my
>> testing. So either there's a misunderstanding here, or there's a
>> bug I'm missing.
>>
>> If fscache is not configured, then nfs_netfs_read_folio() and
>> nfs_netfs_readahead() is a wrapper that returns -ENOBUFS.
>> If it's configured but not enabled, then the checks for
>> netfs_inode(inode)->cache should skip over any netfs code.
>> But maybe there's a non-obvious bug you're seeing and
>> somehow netfs is still getting called?  Because I cannot
>> see netfs getting called if 'fsc' is not on the mount in my
>> tests.
>>
>> int nfs_netfs_read_folio(struct file *file, struct folio *folio)
>> {
>>       if (!netfs_inode(folio_inode(folio))->cache)
>>               return -ENOBUFS;
>>
>>       return netfs_read_folio(file, folio);
>> }
>>
>> int nfs_netfs_readahead(struct readahead_control *ractl)
>> {
>>       struct inode *inode =3D ractl->mapping->host;
>>
>>       if (!netfs_inode(inode)->cache)
>>               return -ENOBUFS;
>>
>>       netfs_readahead(ractl);
>>       return 0;
>> }
>>
>>
>>>>
>>>> Can you be more specific as to the portions of the patch you don't
>>>> like
>>>> so I can move it in the right direction?
>>>>
>>>> This is from patch #2 which you didn't comment on.  I'm not sure
>>>> you're
>>>> ok with it though, since you mention "extra bloat to the inode".
>>>> Do you object to this even though it's wrapped in an
>>>> #ifdef CONFIG_NFS_FSCACHE?  If so, do you require no
>>>> extra size be added to nfs_inode?
>>>>
>>>> @@ -204,9 +208,11 @@ struct nfs_inode {
>>>>       __u64 write_io;
>>>>       __u64 read_io;
>>>> #ifdef CONFIG_NFS_FSCACHE
>>>> -       struct fscache_cookie   *fscache;
>>>> -#endif
>>>> +       struct netfs_inode      netfs; /* netfs context and VFS inode
>>>> */
>>>> +#else
>>>>       struct inode            vfs_inode;
>>>> +#endif
>>>> +
>>>
>>> Ideally, I'd prefer no extra size. I can live with it up to a certain
>>> point, however for now NFS is not unconditionally opting into the netfs
>>> project. If we're to ever do that, then I want to see streamlined code
>>> for the standard I/O case.
>>>
>> Ok and understood about standard I/O case.
>>
>> I was thinking how we might not increase the size, but I don't think
>> I can make it work.
>>
>> I thought we could change to something like the below, without an
>> embedded struct inode:
>>
>> @@ -204,9 +208,11 @@ struct nfs_inode {
>>       __u64 write_io;
>>       __u64 read_io;
>> #ifdef CONFIG_NFS_FSCACHE
>> -       struct fscache_cookie   *fscache;
>> -#endif
>> +       struct netfs_inode      *netfs; /* netfs context and VFS inode *=
/
>> +#else
>>       struct inode            vfs_inode;
>> +#endif
>> +
>>
>> Then I would need to alloc/free a netfs_inode at the time of
>> nfs_inode initiation.  Unfortunately this has the issue that the NFS_I()
>> macro cannot work, because it requires an embedded "struct inode"
>> due to "container_of" use:
>>
>> +#ifdef CONFIG_NFS_FSCACHE
>> +static inline struct inode *VFS_I(struct nfs_inode *nfsi)
>> +{
>> +       return &nfsi->netfs.inode;
>> +}
>> +static inline struct nfs_inode *NFS_I(const struct inode *inode)
>> +{
>> +       return container_of(inode, struct nfs_inode, netfs.inode);
>> +}
>> +#else
>> +static inline struct inode *VFS_I(struct nfs_inode *nfsi)
>> +{
>> +       return &nfsi->vfs_inode;
>> +}
>> static inline struct nfs_inode *NFS_I(const struct inode *inode)
>> {
>>       return container_of(inode, struct nfs_inode, vfs_inode);
>> }
>> +#endif
>>
>>
>
> Actually Trond maybe we can achieve a "0 length increase" of
> nfs_inode if dhowells would take a patch to modify the definition
> of struct netfs_inode and netfs_inode_init(), something like the WIP
> patch below.  What do you think?

That works for me.

>
> I think maybe this could be a follow-on patch and if you/dhowells
> think it's an ok idea I can try to work out what is needed across
> the tree.  I thought about it more and I kinda agree that in the
> case for NFS where fscache is "configured but not enabled",
> then even though we're only adding 24 bytes to the nfs_inode
> each time, it will add up so it is worth at least a discussion.
>
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index f2402ddeafbf..195714f1c355 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -118,11 +118,7 @@ enum netfs_io_source {
> typedef void (*netfs_io_terminated_t)(void *priv, ssize_t transferred_or_=
error,
>                                     bool was_async);
>
> -/*
> - * Per-inode context.  This wraps the VFS inode.
> - */
> -struct netfs_inode {
> -       struct inode            inode;          /* The VFS inode */
> +struct netfs_info {
>       const struct netfs_request_ops *ops;
> #if IS_ENABLED(CONFIG_FSCACHE)
>       struct fscache_cookie   *cache;
> @@ -130,6 +126,14 @@ struct netfs_inode {
>       loff_t                  remote_i_size;  /* Size of the remote file =
*/
> };
>
> +/*
> + * Per-inode context.  This wraps the VFS inode.
> + */
> +struct netfs_inode {
> +       struct inode            inode;          /* The VFS inode */
> +       struct netfs_info       *netfs;         /* Rest of netfs data */
> +};
> +
> /*
> * Resources required to do operations on a cache.
> */
> @@ -312,10 +316,12 @@ static inline struct netfs_inode
> *netfs_inode(struct inode *inode)
> static inline void netfs_inode_init(struct netfs_inode *ctx,
>                                   const struct netfs_request_ops *ops)
> {
> -       ctx->ops =3D ops;
> -       ctx->remote_i_size =3D i_size_read(&ctx->inode);
> +       ctx->netfs =3D kzalloc(sizeof(struct netfs_info)), GFP_KERNEL);
> +       /* FIXME: Check for NULL */
> +       ctx->netfs->ops =3D ops;
> +       ctx->netfs->remote_i_size =3D i_size_read(&ctx->inode);
> #if IS_ENABLED(CONFIG_FSCACHE)
> -       ctx->cache =3D NULL;
> +       ctx->netfs->cache =3D NULL;
> #endif
> }
>
>
>
>>
>>>>
>>>>
>>>> Are you ok with the stub functions which are placed in fscache.h, and
>>>> when CONFIG_NFS_FSCACHE is not set, become either a no-op
>>>> or a 1-liner (nfs_netfs_readpage_release)?
>>>>
>>>> #else /* CONFIG_NFS_FSCACHE */
>>>> +static inline void nfs_netfs_inode_init(struct nfs_inode *nfsi) {}
>>>> +static inline void nfs_netfs_initiate_read(struct nfs_pgio_header
>>>> *hdr) {}
>>>> +static inline void nfs_netfs_read_completion(struct nfs_pgio_header
>>>> *hdr) {}
>>>> +static inline void nfs_netfs_readpage_release(struct nfs_page *req)
>>>> +{
>>>> +       unlock_page(req->wb_page);
>>>> +}
>>>> static inline void nfs_fscache_release_super_cookie(struct
>>>> super_block *sb) {}
>>>> static inline void nfs_fscache_init_inode(struct inode *inode) {}
>>>>
>>>>
>>>> Do you object to the below?  If so, then do you want
>>>> #ifdef CONFIG_NFS_FSCACHE here?
>>>>
>>>> -- a/fs/nfs/inode.c
>>>> +++ b/fs/nfs/inode.c
>>>> @@ -2249,6 +2249,8 @@ struct inode *nfs_alloc_inode(struct
>>>> super_block *sb)
>>>> #ifdef CONFIG_NFS_V4_2
>>>>       nfsi->xattr_cache =3D NULL;
>>>> #endif
>>>> +       nfs_netfs_inode_init(nfsi);
>>>> +
>>>>       return VFS_I(nfsi);
>>>> }
>>>> EXPORT_SYMBOL_GPL(nfs_alloc_i
>>>> node);
>>>>
>>>>
>>>> Do you object to the changes in fs/nfs/read.c?  Specifically,
>>>> how about the below calls to netfs from nfs_read_folio and
>>>> nfs_readahead into equivalent netfs calls?  So when
>>>> NFS_CONFIG_FSCACHE is set, but fscache is not enabled
>>>> ('fsc' not on mount), these netfs functions do immediately call
>>>> netfs_alloc_request().  But I wonder if we could simply add a
>>>> check to see if fscache is enabled on the mount, and skip
>>>> over to satisfy what you want.  Am I understanding what you
>>>> want?
>>>
>>> Quite frankly, I'd prefer that we just split out the functionality that
>>> is needed from the netfs code so that it can be optimised. However I'm
>>> not interested enough in the cachefs functionality to work on that
>>> myself. ...and as I indicated above, I might be OK with opting into the
>>> netfs project, once the overhead can be made to disappear.
>>>
>> Understood.
>>
>> If you think it makes more sense, I can move some of the nfs_netfs_*
>> functions into a netfs.c file as a starting point.  Or that can maybe
>> be done in a future patchset?
>>
>> For now I was equating netfs and fscache together so we can
>> move on from the much older and single-page limiting fscache
>> interface that is likely to go away soon.
>>
>>>>
>>>> @@ -355,6 +343,10 @@ int nfs_read_folio(struct file *file, struct
>>>> folio *folio)
>>>>       if (NFS_STALE(inode))
>>>>               goto out_unlock;
>>>>
>>>> +       ret =3D nfs_netfs_read_folio(file, folio);
>>>> +       if (!ret)
>>>> +               goto out;
>>>> +
>>>>
>>>> @@ -405,6 +399,10 @@ void nfs_readahead(struct readahead_control
>>>> *ractl)
>>>>       if (NFS_STALE(inode))
>>>>               goto out;
>>>>
>>>> +       ret =3D nfs_netfs_readahead(ractl);
>>>> +       if (!ret)
>>>> +               goto out;
>>>> +
>>>>
>> The above wrappers should prevent any additional overhead when fscache
>> is not enabled.  As far as I know these work to avoid calling netfs
>> when 'fsc' is not on the mount.
>>
>>>>
>>>> And how about these calls from different points in the read
>>>> path to the earlier mentioned stub functions?
>>>>
>>>> @@ -110,20 +110,13 @@ EXPORT_SYMBOL_GPL(nfs_pageio_reset_read_mds);
>>>>
>>>> static void nfs_readpage_release(struct nfs_page *req, int error)
>>>> {
>>>> -       struct inode *inode =3D d_inode(nfs_req_openctx(req)->dentry);
>>>>       struct page *page =3D req->wb_page;
>>>>
>>>> -       dprintk("NFS: read done (%s/%llu %d@%lld)\n", inode->i_sb-
>>>>> s_id,
>>>> -               (unsigned long long)NFS_FILEID(inode), req->wb_bytes,
>>>> -               (long long)req_offset(req));
>>>> -
>>>>       if (nfs_error_is_fatal_on_server(error) && error !=3D -
>>>> ETIMEDOUT)
>>>>               SetPageError(page);
>>>> -       if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE)) {
>>>> -               if (PageUptodate(page))
>>>> -                       nfs_fscache_write_page(inode, page);
>>>> -               unlock_page(page);
>>>> -       }
>>>> +       if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE))
>>>> +               nfs_netfs_readpage_release(req);
>>>> +
>>>
>>> I'm not seeing the value of wrapping unlock_page(), no... That code is
>>> going to need to change when we move it to use folios natively anyway.
>>>
>> Ok, how about I make it conditional on whether fscache is configured
>> and enabled then, similar to the nfs_netfs_read_folio() and
>> nfs_netfs_readahead()?  Below is what that would look like.
>> I could inline the code in nfs_netfs_readpage_release() if you
>> think it would be clearer.
>>
>> static void nfs_readpage_release(struct nfs_page *req, int error)
>> {
>>       struct page *page =3D req->wb_page;
>>
>>       if (nfs_error_is_fatal_on_server(error) && error !=3D -ETIMEDOUT)
>>               SetPageError(page);
>>       if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE))
>> #ifndef CONFIG_NFS_FSCACHE
>>               unlock_page(req->wb_page);
>> #else
>>               nfs_netfs_readpage_release(req);
>> #endif
>>       nfs_release_request(req);
>> }
>>
>>
>> void nfs_netfs_readpage_release(struct nfs_page *req)
>> {
>>   struct inode *inode =3D d_inode(nfs_req_openctx(req)->dentry);
>>
>>   /*
>>    * If fscache is enabled, netfs will unlock pages.
>>    */
>>   if (netfs_inode(inode)->cache)
>>       return;
>>
>>   unlock_page(req->wb_page);
>> }
>>
>>
>>>>       nfs_release_request(req);
>>>> }
>>>>
>>>> @@ -177,6 +170,8 @@ static void nfs_read_completion(struct
>>>> nfs_pgio_header *hdr)
>>>>               nfs_list_remove_request(req);
>>>>               nfs_readpage_release(req, error);
>>>>       }
>>>> +       nfs_netfs_read_completion(hdr);
>>>> +
>>>> out:
>>>>       hdr->release(hdr);
>>>> }
>>>> @@ -187,6 +182,7 @@ static void nfs_initiate_read(struct
>>>> nfs_pgio_header *hdr,
>>>>                             struct rpc_task_setup *task_setup_data,
>>>> int how)
>>>> {
>>>>       rpc_ops->read_setup(hdr, msg);
>>>> +       nfs_netfs_initiate_read(hdr);
>>>>       trace_nfs_initiate_read(hdr);
>>>> }
>>>>
>>>>
>>>> Are you ok with these additions?  Something like this would
>>>> be required in the case of fscache configured and enabled,
>>>> because we could have some of the data in a read in
>>>> fscache, and some not.  That is the reason for the netfs
>>>> design, and why we need to be able to call the normal
>>>> NFS read IO path (netfs calls into issue_read, and we call
>>>> back via netfs_subreq_terminated)?
>>>>
>>>> @@ -101,6 +101,9 @@ struct nfs_pageio_descriptor {
>>>>       struct pnfs_layout_segment *pg_lseg;
>>>>       struct nfs_io_completion *pg_io_completion;
>>>>       struct nfs_direct_req   *pg_dreq;
>>>> +#ifdef CONFIG_NFS_FSCACHE
>>>> +       void                    *pg_netfs;
>>>> +#endif
>>>>
>>>> @@ -1619,6 +1619,9 @@ struct nfs_pgio_header {
>>>>       const struct nfs_rw_ops *rw_ops;
>>>>       struct nfs_io_completion *io_completion;
>>>>       struct nfs_direct_req   *dreq;
>>>> +#ifdef CONFIG_NFS_FSCACHE
>>>> +       void                    *netfs;
>>>> +#endif
>>>>
>>>>
>>>> And these additions to pagelist.c?
>>>>
>>>> @@ -68,6 +69,10 @@ void nfs_pgheader_init(struct
>>>> nfs_pageio_descriptor *desc,
>>>>       hdr->good_bytes =3D mirror->pg_count;
>>>>       hdr->io_completion =3D desc->pg_io_completion;
>>>>       hdr->dreq =3D desc->pg_dreq;
>>>> +#ifdef CONFIG_NFS_FSCACHE
>>>> +       if (desc->pg_netfs)
>>>> +               hdr->netfs =3D desc->pg_netfs;
>>>> +#endif
>>>
>>> Why the conditional?
>>>
>> Not really needed and I was thinking of removing it, so I'll do that.
>>
>>>>
>>>>
>>>> @@ -846,6 +851,9 @@ void nfs_pageio_init(struct nfs_pageio_descriptor
>>>> *desc,
>>>>       desc->pg_lseg =3D NULL;
>>>>       desc->pg_io_completion =3D NULL;
>>>>       desc->pg_dreq =3D NULL;
>>>> +#ifdef CONFIG_NFS_FSCACHE
>>>> +       desc->pg_netfs =3D NULL;
>>>> +#endif
>>>>
>>>>
>>>> @@ -1360,6 +1369,9 @@ int nfs_pageio_resend(struct
>>>> nfs_pageio_descriptor *desc,
>>>>
>>>>       desc->pg_io_completion =3D hdr->io_completion;
>>>>       desc->pg_dreq =3D hdr->dreq;
>>>> +#ifdef CONFIG_NFS_FSCACHE
>>>> +       desc->pg_netfs =3D hdr->netfs;
>>>> +#endif
>>>
>>> Those all need wrapper functions instead of embedding #ifdefs.
>>>
>> Ok.
>>
>>
>>
>>>>
>>>>
>>>>> My expectation is that the standard I/O path should have minimal
>>>>> overhead, and should certainly not increase the overhead that we
>>>>> already have. Will this be addressed in future iterations of these
>>>>> patches?
>>>>>
>>>>
>>>> I will do what I can to satisfy what you want, either by fixing up
>>>> this patch or follow-on patches.  Hopefully the above questions
>>>> will clarify the next steps.
>>>>
>>>
>>> --
>>> Trond Myklebust
>>> Linux NFS client maintainer, Hammerspace
>>> trond.myklebust@hammerspace.com



Trond Myklebust
CTO, Hammerspace Inc
1900 S Norfolk St, Suite 350 - #45
San Mateo, CA 94403
[cid:6211feb6-dd19-4ca0-a070-f5248aee1e6f@namprd13.prod.outlook.com]

www.hammer.space<http://www.hammer.space>



--_004_1B2E1442EB0A43E396BB15C717E966E5hammerspacecom_
Content-Type: image/png; name="Hammerspace-email.png"
Content-Description: Hammerspace-email.png
Content-Disposition: inline; filename="Hammerspace-email.png"; size=44630;
	creation-date="Mon, 31 Oct 2022 22:22:31 GMT";
	modification-date="Mon, 31 Oct 2022 22:22:31 GMT"
Content-ID: <6211feb6-dd19-4ca0-a070-f5248aee1e6f@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAASwAAAAlCAYAAAD4BdQJAAAABmJLR0QA/wD/AP+gvaeTAAAACXBI
WXMAAA9hAAAPYQGoP6dpAAAAB3RJTUUH4goMAgcDQvKkIwAAIABJREFUeAEAXIOjfAH/////AAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
BAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP3+/wD8/v8AAAAAAAQCAQADAgEA
AAAAAAAAAAAAAAAAAAAAAAAAAAD+/wAA+/3+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAQABAAYEAQD8
/v8A/f7/AAUDAQACAQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+Pj4APf39wAAAAAAAAAAAAAA
AAACAgIADw8PAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/Pz8APLy8gABAQEAAAAA
AAAAAAABAQEADg4OAAICAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
6enpAOrp6QABAQEAAAAAAP///wASExMAGxsbAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAA8vLyAP39/QAAAAAAAAAAAAAAAAACAgIADw8PAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9/b2APj5+QAAAAAAAAAAAAAAAAAAAAAADw8P
AAICAgAAAAAAAAAAAPv7+wD09PQAAAAAAAAAAAAAAAAAAAAAAAUFBQAMDAwAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wDy8vIA/v7+AAAAAAAAAAAAAAAAAAEBAQAQ
EBAAAAAAAAAAAAAAAAAA9vb2APn4+AAAAQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAcHAAkKCgAAAAAAAAAAAPX19QD6+voAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEBAAYGBgADAgIAAgMDAAUFBQAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPv9/wDz+P0A0+T1AODt+AD3
+v4ACAUCABYOBQAqGgoAGA4GAAYEAQACAQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9vr+APL3
/QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEAAAcEAQAFAwEABAIBAAUEAgACAQAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/f7/AMHZ8QADAwEA
Fw0FACgZCgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAP7/AAD5+/4A4+/5ANHj9QDl8PkA+fv+AAkFAwAWDgUAKBgJACcY
CgAFBAEABAIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOny+wD//wAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAcCAAwIAwAAAAAA
AAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPz+/wCJtuQA6fL7AAAAAABTMxMA
PycPAAAAAAAAAAAAAAAAAAAAAAAAAAAA1eX1AJ3D6QD/AAAAAAAAAAAAAAAAAAAAAAAAABYNBQB1
SRwAt9PuALXR7wBqQhgAMB0MAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM3MzAC8uroA/wAAAAAA
AAAA/wAAEBEQAHBycgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOXl5QCZlpYABgcH
AAAAAAAAAAAACQgJAGlsawAODg4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
/v7+ALKwsQDm5eYAAAEAAAAAAAAA//8ABwgIAHh6eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAA/v7+AKWjowDp6ekAAAAAAAAAAAAAAAAA/v3+AF1gXwAlJSUAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/P39AJWUlQD08/IAAAEBAAAAAAAAAAAA/v3+
AHFzcgAREhIAAAAAAAAAAADg398Ap6WmAP7//gAAAAAAAAAAAAD/AAAMDQ0AaGppAAwMDAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADg4OAApKGiAP3+/QAAAAAAAAAAAAD/AAAD
BAMAfX9/AAAAAAAAAAAAAAAAALy7uwDLycoAAwQDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/v3+ADk6OQBJS0sAAAAAAP///wC2tLUA1dTU
AAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAEACQkJABESEQAaGhsA
LzEwABwcHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMXb8AC10e0A2Ob3APz+/wAC
AQAAAAAAAAAAAAD//wAA/v//ABELBQArGwoARCoRADMhDgAAAAAAAAAAAAAAAAAAAAAAAAAAAMDY
7wCTveYAAwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgYCABYOBgAhFAgAPCYP
ADciDgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKfJ6gCkxukA
BgQBABoQBwCNWCMACwcDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAANPk9AC40u4A0uT1AO70+wADAwEAAgEBAAAA/wAAAAEA/v//AP7+
AAAKBwIAKhkKAEApEABAKBEAAAAAAAAAAAAAAAAAAAAAAAAAAABmoNkA/P7/AAEAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAFc2FgBeOhcA
AAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPv9/wCFsuAA1OX2AAAAAAD//wAA
9fj8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPf6/gDk7fcAAAAAAAAAAAAAAAAAAAAAAAAAAAD/
/f0A////APH1+wDj7PYA9/n9AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAgIAAwQEAAAA
AAAAAAAA////AAMDAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAQEAAwQE
AAQEBAAAAAAAAAAAAAMEAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAOjo6ADs7ewAAwQCAAAAAAAAAAAAAAAAAPr6+QDLy8sANTU1AAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwQABAQEAAAAAAAAAAAAAAAAAAAEAACtrKwAcHFxAAgI
CAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAK6rrAD39/YABAUFAAAAAAAAAAAAAAAA
AP4C/gAAAQEAAAAAAAAAAAAAAAAAAQEBAAMEAwAC/wIAAAAAAAAAAAAAAAAA+Pj3AMXExQBHSEcA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAArKurAAABAAAEBAQAAAAAAAAAAAD/
//8ABAMEAAAAAAAAAAAAAAAAAAAAAAACAgIABAUEAAMDAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP4C/gABAgMAAAAAAAAAAAAAAAAAAwMD
AAQFBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPr7+gDp6ekA
6enpAM3NzAA6OzsAREVFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKrI6AClxugABAMBAAEAAAAF
AQAAAQEAAAYDAgD5/P4AAAEAAAABAAD19/oAytz6AMfa7wA0IQ4Aek4hAAICAQAAAAAAAAAAAAAA
AAADAQAACAH+AAICAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP38/QDn7vcA5+73
AMPY7gAuHQwAgVMiAAEAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPf6/QCwy+gA
CwQAAAAA/wDp7vYA2eb1ADIhDgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAA/P7/AJi84wC/1+4AAAAAAAAAAAAIAwAAAAAAAAEAAAAFAwIA+/z9AP8A
AAAAAgAA/fv9ANPi8QDS4fEAutLrAIFUJQAFAgEAAAAAAAAAAAAAAAAACAL/APsA/wABAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAf8A
AAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACUu+IAzuDxAAUDAQD/AAAA
//8AAP///gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP4A//78AP8AAAAAAAAAAAAAAAAAAAAA
AAAA//4DAAAAAAAA//4A/v38AAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AP7+
/wAA/wAAAAAAAP8A/wD+/v8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8A
AP7+/wD+/f8AAAAAAAAAAAD+/v8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAADRz9AA+Pf4AAIDAgAAAAAAAAAAAAAAAAABAAAA0c7PADExMQAEBAQAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//7+AP79/gAAAAEAAAAAAAAAAAAAAAAA+v76AMG/
wABHSUgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOHh4QDb2toA//8AAP/+/wAAAAAAAAAA
AAAAAAD+/v8AAAAAAAAAAAAAAAAAAAAAAP8AAAD+/v8A//7/AAAAAAAAAAAAAAAAAAAAAADHxsYA
MDEwABcXFwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAsK+wAPTy8wADBAQA//7/AAAAAAAA
AAAAAAD/AP4C/gAAAAAAAAAAAAAAAAAAAAAA////AP79/gABAAIAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD+/v4AAP//AAAAAAAAAAAAAAAA
AP7//gD+/f4AAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAQEAwL6/APDw8ABSU1MAAgICAAAAAAAAAAAAAAAAALLM6QCdv+EACAUDAAwJBQBU
NxkAOSUQABQNBgAAAAAAAAAAAPD1+wDX5vUAydzvAMPX7gD//v8Ax9rtAIOv/QB/UyUAAAAAAAAA
AAAAAAAA//7+AP78/AADBAEAYD4cAB0UCQAAAAAAAAAAAAAAAAAAAAAA////APf6/gDn7/kA2+n1
AMnb8AD///8Az97wAHCh1wCGWCcACwcDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC30esA
/vz8AAUEAgD8/f4A//4AAKbF5QAyIQ4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAA8vf8AIqx3QDP4fIABQMBAAUEAgA8JxEAOiYSACkbDAAMCAMAAAAAAAAA
AADv9fsA1+b0AMfZ8ADF2e4A/v//ANPg8gBil9EAdEwiAC8fDgAAAAAAAAAAAP/8/AD//f4ABQQC
AItcKAD3+v4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
EgwFAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACBrtsA0ODzAAQBAAD//QAA
AAAAAAD/AAAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//7/AP/9/QAAAAAAAAAAAAAAAAAA
AAAAAAAAAP/+/QAAAAAA///+AAD+/QD///8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//
/wD+/v0AAAAAAAAAAAD///8A/v/+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAA/wD+/v0A/v/9AAAAAAAAAAAA///+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAD+//4AxsTFAAMEAwD//f4AAAAAAAAAAAAAAAAA/wAAAOXm5QDu7u4AFhYWAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP7//gD+//4AAAAAAAAAAAAAAAAAAAAAAAD/
AADFxcQAODk4AA8QEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC1tLMA+vv6AAEBAQAAAAAAAAAA
AAAAAAAAAAAA/v/+AAD//wAAAAAAAAAAAAAAAAD///8A/v79AP///wAAAAAAAAAAAAAAAAAAAAAA
////AKCfngB3eHkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4uLiANTT0gABAgEA/v79AAAAAAAA
AAAAAAAAAAAAAAAB/gEAAAAAAAAAAAAAAAAAAAAAAP7+/gD+//4AAf/9AAAAAAAAAAAAAAAAAP7+
/gABAQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/f39AP7//gAAAAAAAAAA
AAAAAAD///8A/v/+AAAAAAAAAAAAAAAAAAAAAAD///8AAAAAAAAAAAAAAAAAAAAAAAAAAAABAQEA
AAAAAAAAAAAAAAAAAP8AAAQFBADU09MAJycnAC0uLgAAAAAAAAAAAOzz+gCvyeUACQMAAAoFAACX
YiwACgcDAAAAAAAAAAAAAAAAAAAAAAAQCwUAOSUQADgkEABiPx0Ag63YAN3o9QB5TyMAAAAAAAAA
AAAAAAAAAAAAAAD//wD//vwAAP4CACQXCQAoGw0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AP7//wDy9/0AeabWAObv+ADf6fQAqcblAGJBHgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD6/P4A
w9XrAP78/AApHA8AHxUKAKzI5gDU4fAA0eHTL72VAAAgAElEQVTyAC8fDgAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+Pr9AH6p1wDf6vYAAwAAAA0GBACKXioAGA8IAAEB
AAAAAAAAAAAAAAAAAAAAAAAAEQsFADolEQA5JBEAXT4aAH2n1wDm7/gA8vX9AODq9QAvHw4AAAAA
AAAAAAD+/f0A/v7+AAH+/wAeEwkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAACZu+EA
zd3wAAMBAAD/AAAAAAAAAAAAAAD+/wAA////AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/
/v0AAP8AAAAAAAAAAAAAAAAAAAAAAAD//f4AAAAAAAD+/wD+/f0AAP4AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAD///8A//7/AP8A/wAAAAAAAP//AP/9/gAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAD//wAA//7+AP7+/gAAAAAAAAAAAP79/gAA/wAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAube5AP3+/QAB/gEAAAAAAAAAAAAAAAAAAAAAAAAAAAD9
+/0AxsXFAFBRUQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD+/v8A/v3+AAAB
AAAAAAAAAAAAAAAAAAAAAAAA//7/AKCfnwBvcXEAAAAAAAAAAAAAAAAAAAAAAAAAAAC/vr4A4uDi
AAYHBgD///8AAAAAAAAAAAAAAAAAAAAAAP79/gD/AAAAAAAAAAAAAAAAAAAAAP//AP/+/wD+//4A
AAAAAAAAAAAAAAAAAAAAAAAAAAD08/QAu7q6AEVGRgAAAAAAAAAAAAAAAAAAAAAAAAAAALu5uQD5
+fkAAQEBAAAAAAAAAAAAAAAAAAAAAAAA/wAAAgEBAAAAAAAAAAAAAAAAAAAAAAAA/wAA/v3+AAEB
AQAAAAAAAP8AAAwMDAA+QD8A/fz8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AP///wAaGxsAAAAAAAAAAAAAAAAA//7/AP79/gAAAQAAAAAAAAD/AAAcHR0AISEhAAAA/wAAAAAA
AAAAAAAAAQD7+/sA7u7tAOXl5gDz8vIAAgMCAAAAAAAAAAAAAP8AAMHAwQAtLi4AAAAAAAAAAADi
6/UA7vL3AP7/AABgRiAACgcDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAQAADgoEAIhb
KwDu9foABgQCAAAAAAAAAAAAAAAAAAAAAAD//v4A/vz8AP4AAgD///8AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAACAQEAEAoEAINWJwBundEA9Pj8AKvE4gBcPRwABgQCAAAAAAAAAAAA
AAAAAAAAAAAAAAAA3Of0ANbi8QAHBQIAOicRAEYvFwCxyeQAAgH/AJy73gCTZDAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKfE4wDb5fEAAwIBACUZDQCMXy4AAQEAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEAABYOBwCZZzAAhq3YABYQBwBPNRkAAAAA
AAAAAAAAAAAA//37AP/9/wD+AQMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAACJsNsA
xdnuAAIBAAD//wAAAAAAAAAAAAAAAAAAAP8AAAD//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//8A//7+AAD/AAAAAAAAAAAAAAAAAAAAAAAA////AAAAAAAA/wAA//7+AAAA/wAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAA////AP3+/QAA/wAAAAAAAP///wD+//8AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AP39/gD+/f4AAAAAAAAAAAD+/v4A/wD/AAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9/f3AM3MzAABAgIA/f7+AAAAAAD///8AAAAAAAEBAQAA
AAAAAAEBAMfGxwBJSkoABwcHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//7+AP7+
/gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADq6eoAu7q6AEVGRgAAAAAAAAAAAAAAAADm5uYAwb/A
AAQEBAD+/f4AAAAAAAAAAAAAAAAAAAAAAAAAAAD+/v4AAAAAAAAAAAAAAAAAAAAAAAAAAAD+/v4A
/v7+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMfFxgA4OTkADQ0NAAAAAAAAAAAAAAAAAMLCwgDb
2tsABAQEAP8A/wAAAAAAAAAAAAAAAAAAAAAAAAAAAP3+AQAAAAAAAAAAAAAAAAAAAAAA////AP7+
/gAB/QEAAAAAAAAAAAAICgkAODk5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP7//gD+/v4AAAAAAAAAAAD///8AICAfAEVHRgAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAADy8vIAp6WlAOPi4wAAAAAAAAAAAAAAAADh4OAA9fX1AAsLCwAA
AAAA6vD4APv6/AAHBQMAGhEIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAADAgEAFQ0HAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AP/9/QD/Af8A//8AAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUDgcAQisTAK3I5AD9/f8AvtLpAEgyGQAAAAAA
AAAAAAAAAAAAAAAAAAAAAI+x2AAEAf4ABwIAAEYvFwAAAAAAVjobAKO/4ADl7PQA1eLxACseDwAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANzn8wCowd8ABgUDAAkDAwB7VCgAAQEAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHRPJgAGBAIAAAAA
AAAAAAAAAAAAAAAAAP79/AD+/f8A/wL/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAAAAAACdveAA
xNfrAAH//gD//v4A//7+AP/+/gD//v4A//7+AP7+/QD//v8AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAP//AP/9/gD//v4A//7+AP/+/gD//v4A//7+AP/9/QAA/wAA/v7+AP/9/QD///8AAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wD+/v4A/v/+AP7//gD+//4A/v7+AAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8AAAD+/v0A/v/+AP7//gD+//4A/v/+AAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANfW1wD39/YA///+AP///gD+/v0AMTIxABoaGQD9
/fwA///+AP///gAAAP8AuLe3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP7/
/gD+/v4A/v/+AP7//gD+//4A/v/+AP7//gD+//4A/wD/AMnIyADv7+8AAAAAAAAAAAD///8AvLq7
APn6+QD+//4A/v/+AP7//gD+//4A/v/+AP7//gD+//4A/v7+AAD/AAAAAAAAAAAAAAAAAAD///8A
/f79AP7//gD+//4A/v/+AP7//gD+//4A/v/+AP7//gD19vUAq6ioAAAAAAAAAAAAAAAAAO3s7QC2
tLQAAgMCAP7//gD+//4A/v/+AP7//gD+//4A/v/+AP3+/QD+/v4AAAAAAAAAAAAAAAAAAAAAAP7/
/gD9/v0A/v/+AP7//gD9/v0A//3+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//v8A/f79AP7//gD+//4A/f79AP7+/gAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADg4OAENERAAAAQAA/v/+AP7//gD+//4A/v/+AOHg4AAA
AAAAAAAAAAH//wD//fwA/Pz7APr7/QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///gD+/fwA/v39AAD//wAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADwqFQD6+fsAAgD+ANnj8AAAAAAA
AAAAAAAAAAAAAAAAAAAAAMva7ADh6PIA+fj6AGNEIgAAAAAAAAAAAEEsFgAMBgEA+Pf6AL/S5wAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACTstgAAwH/APj3+gBnRyMAEgwGAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGBAIAAAAA
AAAAAAAAAAAAAAAAAAAAAAD//f4A//39AP79/QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAACdu94A
rsbjAAD+/gD+/f0A/v39AP79/QD+/f0A/v39AP79/QD//f0AAAD/AAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAP///wD//f0A/v39AP79/QD+/f0A/v39AP79/QD//v4AAAAAAAD//gD+/P0AAP//AAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///8A//3/AP79/gD+/f4A//3/AP/+/QAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8A/v7/AP79/gD+/f4A/v3+AP7+/wAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADOzc0A/Pz8AP79/gD+/f4AAAAAACsrLABQ
UlIA+Pf4AP79/gD+/f4AAQABANPR0gD19PUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAD+/v8A/v7+AP79/gD+/f4A/v3+AP38/QD+/f4A/v3+AP79/gDy8fIAr62uAAAAAAAAAAAA1dPU
ANPS0gD//v8A/v3+AP79/gD9/P0A/fz9AP79/gD+/f4A/v3+AP7+/gAAAP8AAAAAAAAAAAAAAAAA
/wAAAP/+/wD+/f4A/v3+AP79/gD+/P0A/fz9AP79/gD+/f4AAQABANbW1wDFw8QAAAAAAP///wC2
tbUAAP8AAP79/gD+/f4A/v3+APz7/AD//f8A/v3+AP79/gD//v8A/v3+AAAAAAAAAAAAAAAAAAAA
AAD///8A//3/AP79/gD+/f4A//7/AP7//gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////AP/+/wD+/f4A/v3+AP/+/wD///8A
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAXGBgAAgECAP79/gD+/f4A/v3+AAD/AADz
8/MAAAAAAAAAAAATDQYAAf/+APv6+wC+0OYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAPz9AAD9/AAAAP8AAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQCwUA/vz8AP/8/AD2+fsA
AAAAAAAAAAAAAAAAAAAAAP7+/wCtxOAABAH/ABkQBgBFMRkAAAAAAAAAAAAZEgkAJRkLAAD+/QC3
yuMA+Pr9AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADg6fQA4unzAP/9/AAjFwoAQi8YAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAA//38AP/8/AD//fwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAA
vNHnAAH//QD//fwA//39AAD+/QAA/v0AAP79AAD+/QAA/v0AAP79AP///wAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAABAP8A//79AAD+/QAA/v0AAP79AAD+/QAA/v0AAP/9AAAAAAD///4AAP/9AP//
/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAP3//QD+//4A/v/+AP3//QD8/v4AAAAA
APz8/AD8/PwA/Pz8APz8/AD8/PwA/Pz8APz8/AD+/v4A+/z8AP7//gD+//4A/v/+AP7//gD+/v0A
AP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADx8PAA09LSAP/+/wD+/v4A/v7+AAoJCgAg
IiAAGxsbAB0eHgD+/v4A/v7+AP7+/gDy8vIA3NzbAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAD///8A/v/+AP7//gD+//4A/v/+AAABAAAdHh0A/f79AP7//gD+//4AAAEAANLS0QDOzc0A+/v7
AKCgoAABAgEA/v/+AP7//gD8/fwAFxgYAA4PDgD+//4A/v/+AP7//gD9//4A/wAAAAAAAAAAAAAA
AAAAAP//AAD9/v0A/v/+AP7//gD9/v0ACgwMABweHQD8/fwA/v/+AP7//gACAwIAvb29APLy8gDf
398Azc3MAP7//gD+//4A/v/+AAECAQApKikA+/37AP7//gD+//4A/f79AP7//gAAAAAAAAAAAAAA
AAAAAAAA/v7/AP3//QD+//4A/v/+AP3+/QD9/v4AAAAAAP39/QD9/f0A/f39AP39/QD9/f0A/f39
AP39/QD9/f0A/f39AP7+/gAAAAAAAAAAAAAAAAAAAAAAAAAAAP7//gD9/v0A/v/+AP7//gD+/v0A
/v//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/fz9AP3+/QD+//4A/v/+AP7//gD8
/fwACQkKAAAAAAAAAAAAHhYLABAKAwAC//4AtsnhAJi01gD6/P4AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//7/AP79/AD+/PwA////
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5u31AAH+/AD+/PwA
EwwGAAAAAAAAAAAAAAAAAAAAAADj6/UA2eLuAP/9/ABJMxoAAwIBAAAAAAAAAAAAAAAAAFY9IAD7
+vsA+vn7AJy32AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA2+TwAPn5+gD9+/wATTgcAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP79/QD//fwA/v39AAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAA
AAAAAAD+/gD6+/wAPywXAObt9gDg6vUAAAAAAAAAAAAAAAAAAAAAAP///wAA//4AAAAAAAAAAAAA
AAAAxdbqAPP3+wABAAEA3ujzAP/+/QD//wAAAAAAAAAAAAAAAAAAAAAAAP/9/QAAAP8AAP//AP79
/AAAAP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///gD+/v4AAP8AAAAAAAAAAAAA8vHy
AJSSkgD///8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEBAPj4+AADAwMA/v3+AAAAAAAAAAAA
/v7+AAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAqqmqAAICAgD+/v4AAAEAAP38/QAs
LS0ACgkKAAAAAAAxMjEAtrW1AAD/AAAAAAAA////AMXExAAvMDAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAP/+/gD+/f4AAAAAAAAAAAD///8AR0lIALi1twDe3t4AAwMDAAAAAAAEAwQAsrCx
AMnIyQD///4A/v0BAAAAAAD///8ACwwLAF5gXwCWlJQA/v3+AAAAAAAAAAAA//79AAAAAAAAAAAA
AAAAAAAAAAAA//8A/v7+AP/+/wAAAAAA/wD/APn5+ABjZGQAhoSFAPj39wAAAAAAAAAAAPDw7wC3
trYA1NPUAAMDAwD+/f4AAAAAAP7+/gAvLy8AHh4fANLS0gAA/wAAAAAAAP8A/wD+/v4AAAAAAAAA
AAAAAAAAAAAAAAD//gD+/v4A/v3+AAAAAAAAAAAA7u3tAJuZmgD+//4AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAPv6+wBLTUwAISEhAAAAAAAAAAAAAAAAAAAAAAD//v8A/v7+AAEAAQAAAAAA
/v/+AP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANzc2wD6+voA//7/AAAAAAAA
AAAA+/r7AB0eHQAAAAAAAAAAABYQCQBXPyIAi6nQAA0JBACswd0AxtTnADkqFwA3KRcAMSQVAAEB
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//gD//f0A/wL/
AAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALLF3wAEAQAA
9/n6ADYmFQAAAAAAAAAAAAAAAAAAAAAAtMjgAPP1+QAKBwQAPi0ZAAAAAAAAAAAAAAAAAAAAAAAw
IxMAJBkMAN3m8QC1x98AW0IjABENCAAAAAAAAAAAAAAAAAAAAAAAAAAAAN/o8gD9/PwABAIBACgc
EAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//fwA/v3/AAD+/QAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE
AAAAAAAAAAAA/v0AA//+AHZTKwDF1uoAiKrSAAMCAQAAAAAAAAAAAAAAAAAA//8AAP7/AAAAAAAA
AAAA8/b7AICjzwAFBQIAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//v4AAAAAAAD+
/gAA/f0AAP7/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///8A/v3+AAAAAAAAAAAAAAAA
AP76+gDe3d4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP7//gAAAAAA
AAAAAP7+/wD/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7ezsANbV1QABAQEA/v7+AAAAAAD6
+voATE1NAAAAAAAAAAAAKywsALm3uAD7+/sAAAAAAAAAAADT0tMA6+rqABUWFgAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAD+/v8A/v7+AAAAAAAAAAAAAf8BAP38/gBlaGcAfnx8APz7/AAAAAAAAAAA
APLy8gDy8vIAAAAAAP8A/wAAAAAA/v/+AGNjYwAGBgYA/v3+AP7+/gAAAAAAAAAAAP79/wAA//8A
AAAAAAAAAAAAAAAAAAD/AP79/gD///8AAAAAAAD//wD9/f4ACgoKAEJDQgC0srMAAAAAAAAAAAAA
AAAAycfIAAAAAAAAAAAA/wD/AP///wAEBQUAW11dAMLBwQD+/f4AAQABAAAAAAD///8A/gH+AAAA
AAAAAAAAAAAAAAAAAAD+//8A/v3+AP4B/gAAAAAAAAAAAPj3+ADX1tYAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAJCQkAGBgYAAAAAAAAAAAAAAAAAAAAAAAAAAAA///+AP79/gABAQEA
AAAAAP///wD///8AAAAAAAAAAAAAAAAAAAAAAAAAAAD///8AAQEBAOLh4gCqqaoA/fz9AAAAAAAA
AAAAAP//ABQVFQAREREAAAAAAAAAAOZhrqkAACAASURBVAAAAAAATzogAAgFAQCPqtAAAwAAAOnt
9ACww/QAr8LdAP7+/gAqHxIAQjMdAEExHAAPCwYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAD///8A/v38AP8CAgAAAP4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAANLd7ADN2OgAAP7+ABgPBwAwJBMAAAAAAAAAAAAAAAAA+fr9AKq+2QAFBAMALCAUABwVCwAA
AAAAAAAAAAAAAAAAAAAAAAAAAG5RLQBpjr4ABwYEALDE3wBhSSkAAAAAAAAAAAAAAAAAAAAAAAAA
AADp7fUA//39AAoHBQAJBgMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//39AP/9/gD5+PwA
epvHAP3+/gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAlGw8AZU0sAAAAAAAA
AAAAAAAAAAAAAAAAAAAABAAAAAAAAAAA//7+AAD//gD/AAAA/wD/AP/9/QD+AAIAAAAAAAAAAAAA
AAAA////AP///wAAAAAAAAAAAKnC3gADAf8A//7+AAAAAAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAA//7+AAAAAAD///8A/v7+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//
AP7+/gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAD//v4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMPDwwD+
//4AAP8AAAAAAAD+/f4AOTs6AAUGBQAAAAAAAAAAABcXFwAbHBsA3NvcAAECAQAAAAAABAUEAKin
qABtb24AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/v7+AP7+/gAAAAAAAAAAAAEBAQD/AP8ACAgI
AEtMTACvra4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////ADM0MwAeICAA8vLyAP7+/gD+/v4A
AAAAAAAAAAD+//4A/wAAAAAAAAAAAAAAAAAAAP///wD+/v4A////AAAAAAAAAAAA//7+AAAAAABC
Q0MAzczNAOPh4QACAwMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAaGloAAAAAAD+//8A//7/AP4B
/gAAAAAA////AP7//gAAAAAAAAAAAAAAAAAAAAAA//7/AP7+/gD+/v4AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKCkpAAgICAAAAAAAAAAAAAAAAAAAAAAA
AAAAAP7+/wD///8A////AAAAAAD///8AAP8AAPj4+ACrqaoAAAAAAAEBAAAAAAAA+/v7AOnp6gDh
3+AABwgHAAAAAAAAAAAAAAAAAP///wA+Pz4AAAAAAAAAAAAAAAAAAAAAAAAAAABHNR8AJx0RALLE
3gDH1eYA5Or0AAMDAgAEAwIA1d/sANDc6gCMp8wAKyASAD8wHABFNR8AFRAJAAAAAAAAAAAAAAAA
AAAAAAAAAAAA//7/AP/9/QD+AgAAAP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
/P3+ALzL4gCYstMA+Pn7AAD/AABtUS0AAAAAAAAAAAAAAAAAAAAAAJGszwADAP8A+vn7AHBTLwAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAjGw4AKB0QAN3m8QDBz+IAWkMmAAcGAwAAAAAAAAAAAAAA
AAAAAAAA9/j6AP/9/QACAQQAAwMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/9/QD//f4A
/P4AAMbT5QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD2+fwAVUAkAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAP/+/gD//f4AAP8AAAD//wD//v4AAAD/AAAAAAAA
AAAAAAAAAAD/AAD/AP8AAAAAAPT3+wDK1ukAAf/+AAD9AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAP/+/gAAAAAAAP7/AAD9/QD///4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AP7//wD+/v4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/v7+AAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAPj3+ADU
0tMA//7/AAAAAAAAAAAAAQEBAD8/PwAAAAAAAAAAAAAAAAAAAAAAU1RUAIB+fwAJCQkAAAAAAAEA
AQDd3d0A5+bmABkaGgAAAAAAAAAAAAAAAAAAAAAAAAAAAP///gD+/v4AAAAAAAAAAAABAQEAAP//
AAAAAAA/QEAAw8LDAOno6AABAQEAAAAAAAAAAAAAAAAAAAAAAAEBAQBZW1sAAQEBAAAAAAD+//4A
/v7+AAAAAAAAAAAA/v3+AAAAAAAAAAAAAAAAAAAAAAD/AAAA////AP7+/gAAAAAAAAAAAP7+/QAA
AAAAAAAAAG1ubQB3dHUA/v7+AAAAAAAAAAAAAAAAAAAAAAAAAAAAMzQ0ACIjIwAAAAAA//7/AP7+
/gAAAQAAAAAAAAD/AAD+/f4AAAAAAAAAAAAAAAAAAAAAAP7//gD+/v4A/v7+AAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEBADI0MgABAQEAAAAAAAAAAAAAAAAA
AAAAAAAAAAD///8A/v7+AAAAAAAAAAAA////AP7//gAICAgACgoKAMC/vwABAQEAAAAAAAAAAAAA
AAAABQYFAP7+/gAAAAAAAAAAAAAAAAAREREAPD09AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAY
DgBtVDAAaVAuAN/n8QC7yuEAvczhAO3x9wAEAwIAAwQBAN7k7wDe5O8Ap7rWAHZcNgA9LxwAAAAA
AAAAAAAAAAAAAAAAAAD//gD//fwAAAL/AP///wD///8A3ubxAPn6/QAAAAAAAAAAAPj7/QDs8PYA
0dvqAMfU5gD09/sA////APv8/gBRQCYAPjAcAAAAAAAAAAAAAAAAAOnv9gDI0+QAAP79AEUzHQAW
EQoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABgQDAD8vGgDd4+0A3uTuAM7a6QA5LBoAAAAAAAAA
AAAAAAAAAAAAAAMBAAD//v0A/fv9AP7+/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//fwA
//7+AAIBAQAkGg8A/v7/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AP8ADwoGADUoFwAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAD//v0A//78AAAA/wAA/v8A//39AP8AAQAA
AAAAAAAAAAAAAAD+/wAAAP//AAAAAADd5vEA3+bwAAMDAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAD//v4AAAAAAP///gD+/v0AAAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAA//8A/v7+AAAAAAAAAAAAAAAAAAECAQAPDw8A//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAEBAAD8+/wA8/PzAAEBAQAAAAAAAAAAAP7+/gAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAADg
4OAA4uLiAAYGBgAAAAAAAAAAAA4PDgDl5eYA7e3tAAAAAAAAAAAADAwNACQlJAAjIyMA4uLiAAIC
AgAAAAAA/v7+AMrJyQBPUVEAAAAAAAAAAAAAAAAAAAAAAAAAAAD+/v8A/f79AAEAAQAAAAAAAQEB
AP8AAAAAAAAAAAAAAG9xcAB8enoA/Pz8AAEAAQAAAAAAAAAAAP3+/QBxcnMABQUFAAAAAAAAAAAA
/v7+AP7+/gAAAAAAAAAAAP3//QAA/wAAAAAAAAAAAAAAAAAAAP//AP3+/QD//v8AAAAAAP8A/wD+
/v8AAAAAAAAAAAAICQkAVFdWAKmnqAAAAAAAAAAAAAAAAAD///8ACQoJAFNWVQABAQEAAAAAAAAA
/wD9//0AAP4AAAAAAAD/AP8AAf8BAAAAAAAAAAAAAAAAAAAAAAAA//8A/f7+AAL+/gAAAAAA/wD/
AAUFBQAWFhYA////AAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAAYHBgArKywAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAA/v/+AP3+/QABAAEAAAAAAP7//gD///8AAAAAAEhKSQDNzc0A8fHwAAEAAQAA
AAAAAAAAAAAAAAAAAAAA/wD/AP39/QAfHyAAa2xrAAgICAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAQAAAAUEAgAmHREAJh0RAGtTMADv8vgAztnoAMPR5ADU3esA7PD2AP/9AgB0kb4AfGE5
AE09JQAAAAAAAAAAAAAAAAAA//8A//39AP4CAAAAAP8AAAAAAKy+2ACxwdsAAAAAAAAAAAAAAQAA
AgEBAAMDAQABAQEA/f3+ABwWDQBXRSoAUD4lAAAAAAAAAAAAAAAAAAAAAADH0uQA8fP3AAQDAgBU
QScAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABMOiIAoLTSAAQB/wCRqcsAOSxPAAAA
AAAAAAAAAAAAAAAAAAAQCwUA//z8APX2/gD4+fwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//39AP/9/gAFBgQAnHhGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/
AAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAA//3+AP/+/wAAAAAAAP//AP/+/gD/
AAEAAAAAAAAAAAAAAAAAAP8AAAD//wAAAAAAm7TVAPv7/AD+/QEAAAAAAAAAAAAAAAAABAMCAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAP7+AAAAAAD///8AAP3+AAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAA/v8AAP7+/gD/AP8AAAAAAP///wASDxMAfX9/APv6+wAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAACAwIA3NzcAJCOjgAHBwcAAAAAAAAAAAD9/v4AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAp6alAAIDAgD9/v0AAAAAAAAAAADv7+8An56dAAAAAAAAAAAAAAAAAEhJSQAkJSQAREZFAJua
mgD/AP8AAAAAAAAAAADMzMwAS01NAAQEBAAAAAAAAAAAAAAAAAAAAAAA//7+AP/+/gD/AAAAAAAA
AAEBAgAA//8AAAAAAAAAAAANDQ0AV1hYAKSiogD/AAAAAAAAAAAAAAA7OzsAJicmAAAAAAAAAAAA
AAAAAP/+/gD+/v0AAAAAAAAAAAD//v4AAAD/AAAAAAAAAAAAAAAAAP//AAD//v4A/v7+AAAAAAAA
AAAA/v7+AAAAAAAAAAAAAAAAADw9PQDAv78A5+bmAAAAAAAAAAAA+fn6AHR3dgAMCwsAAAAAAAAA
AAD///8A//7+AP4AAAAAAAAAAAAAAP7+/gAAAAAAAAAAAAAAAAAAAAAA////AP/+/QD+/gEAAAAA
AAD/AAASFxIAeXp7APn6+QAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AAACAwIAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAD//wD//v4A/wAAAAAAAAD///8A//7/AAAAAAALCwsAamtqAH58fAAI
CAgAAAAAAAAAAAAAAAAAAAAAAAQFBQBWVlcAOTs6AAYGBgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEQ4IAEM1IABDNSAA8/X6AKK20gCkttMACwgF
AJyx0AAxJxcAHBYOAAAAAAAAAAAA/wD/AP/9/QD/AgAAAP8AAAEBAQBNPCQAs8HZAP3+/wAAAAAA
AAAAAPv//wADAAMANSsaAFFBKAAuJRYADAkGAAAAAAAAAAAAAAAAAAAAAAAAAAAAqrvVAP/9/QAZ
FAsAEw8JAPDz+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEA0IAE89JACmuNQA5ejxAL3L
3wBDNSEAAAAAAAAAAAAAAAAAHhcMAP79/QD2+/sA4+nxACEaDwAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAP79/QD+/f4A//0BAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAD//gD//v0AAAAAAP8A/wD/
/v0A/wECAAAAAAAAAAAAAAAAAP/+/wACAQAAAAAAADcoFwA/LxoAAAAAAAAAAAD//wAA+fv9AK3A
2wD2+fwAAAAAAAAAAAAAAAAAAAAAAP///gAAAAAAAP/+AP/+/QAA//8AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAP///gD+/v4AAAAAAAAAAAD///8AAAD/AAcHBwAHBwcAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAoJCQD+/P4A/wX/AAAAAAAAAAAA//7+AP8AAAAAAAAAAAAAAAAAAAAA
AAAA2trZAOLh4gAHBwcA////AAAAAAAAAAAAAAAAAAEAAQAAAAAAAAAAAAEBAQA5OTkAAAAAACMj
IwAODg4A8/LzAAAAAAAAAAAA4+HiANjY2AAsLCwAAAAAAAAAAAAAAAAAAAAAAP7//gD9/f8AAQEA
AAAAAAABAf4A////AAAAAAAAAAAAAAAAADc4OADAv78A4eDhAAAAAAALCwsATU9PAAAAAAAAAAAA
AAAAAAD//wD9/v8A/v7/AAAAAAAAAAAA/f3+AP8AAAAAAAAAAAAAAAAAAAAAAP8A/f3+AP///wAA
AAAA////AP7+/QAAAAAAAAAAAAAAAAABAQEAbW9vAHd1dQAA/wAAAAAAAEFDQgAhISEAAAAAAAAA
AAAAAAAA////AP39/gAAAAEAAAAAAP///wACAf8AAAAAAAAAAAAAAAAAAAAAAP7+/wD+/f8A/gL/
AAAAAAD///8A//8AAAECAQAICAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAD+/v8A/f3+AAEBAQAAAAAA/v7+AP///wAAAAAAAAAAABwdHQBP
UFEAtbS0AAICAgAAAAAAAAAAAPr6+gBXUlIAP0FAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0LBgBrVTQA+fr8
ALLB2QDw8fUA19/sABwWDgAAAAAAAAAAAAD+/wD+/f0A/wMAAAD//wAAAAAAKiEUAKaEUAD//wAA
AAAAAAMDAQAQDAgADAoGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwc3gANzi7QAL
CQUA4OXuAExvpgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAAHBYNAK+NVwBlUDAArLzVAP/+
/wCpudUAQDMgAAMCAQAAAAAAAAAAACIaEQAFAwAA/v7+ALTC2QA+MR4AAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAD//v0A//3+AP/9AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAD//f0A//39AAAAAAAA
//8A//79AP/9/QD//f0A//39AP/9/QAA//0AssPbAHybxADc5O4A1N3qANTd6gDR2+kA+fr7AF1G
KAAKBgIA//39AP/9/QD//f0A//39AP/9/QAA/v0AAP8AAAD//wD//v0AAP//AAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAA/v7+AP7+/gD+/v4A/v7+AP7+/gAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAD/AAAA/f79AP7+/gD+/v4A/v7+AP7+/gAAAAAAAAAAAAAAAAAA
AAAAAAAAALSxswAEBAQA/v79AP7+/QD+/v0A/v79AP7+/QD+/v0A/v79APv7+gAmJiYAGBkZAAAA
AAAREhIAIiIiAPz8/AD+/v0A/v79AAQFBQCin6AAAAAAAAAAAAAAAAAAAAAAAAAAAAD+/v4A/v79
AP7+/gD+/v4A/v7+AAAAAAAAAAAAAAAAAAAAAAADAwMAamxsAPz8/AD19fUAZmhnAA8PDwAAAAAA
AAAAAAAAAAD/AAAA/v7+AP7+/gD+/v4A/v7+AP7+/gAAAAAAAAAAAAAAAAAAAAAA////AP7+/gD+
/v4A/v7+AP7+/gD+/v8AAAAAAAAAAAAAAAAAAAAAABAQEABfYGAA/Pz8AAYGBgBQUFAAAAAAAAAA
AAAAAAAAAAAAAP///wD+/v4A/v7+AP7+/gD+/v4A/f/9AAAAAAAAAAAAAAAAAAAAAAD/AP8A/f79
AP7+/gD+/v4A/v7+AP/+/gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//7+AP7+/gD+/v4A/v7+AP7+/gD///4AAAAAAAAAAAAA
AAAAR0lIABQUFAD+/v4A/v7+AP7+/gAEBAQAqqeoANHQ0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AEY3IQAGAwAA//39AN3j7QAAAAAAAAAAAAAAAAD///4AAP79AP/9/gD/AP8AAAAAAAAAAAAeGA8A
HxkPAB8ZDwAcFg4ADAoGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJCkxQAK
BQEA+vj6APj3+AAB/v0AAf79AAH+/QAB/v0AAf79AAH+/QAB/v0A+ff4AHBaNwAAAAAABQQDAE48
JAD+/PwA3uLrAN7k7gAAAAAAAAAAAAAAAAAuJRcACQUBAAH//wDDzuAA3OLuAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAP7+AP/+/QD//v0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAA///+AP/+/gAA
AAAAAP8AAP/9/gD/AAAAAAAAAAAAAAAAAAAAAAAAAODm8QDg5vEAAAAAAAAAAAAAAAAA9/n8AFtF
KQD8/f4A/v7+AP/+/gAAAAAAAAAAAAAAAAAAAAAA/v7+AAAAAAD///8A//3+AP8A/wAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAA//7/AP7+/gAAAAAAAAAAAP///wD//v8AAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8AAP7+/gD+/v4AAAAAAAAAAAD+/v4AAAAAAAAAAAAA
AAAAAAAAAOno6ADh4eEA////AP//AAAAAAAAAAAAAAMDAwABAQEAAAAAAP8A/wD9+voAWlxcAAAA
AAAAAAAAAAAAAExNTQDHxscABgYGAAAAAAAAAAAA6urqANPR0gAtLy4AAAAAAAAAAAAAAAAA//7/
AP///wD///8AAAAAAAEBAQD//wAAAAAAAAAAAAAAAAAAAAAAABAQEABjZmUA29jaACgpKQAAAAAA
AAAAAAAAAAAAAAAAAAAAAP/+/gD+/v4AAAAAAAAAAAD+/v4AAP8AAAAAAAAAAAAAAAAAAP8AAAD+
/v4A////AAAAAAD///8A/v7+AAAAAAAAAAAAAAAAAAAAAAAAAAAANjY3AL27vABOUE8ADA0NAAAA
AAAAAAAAAAAAAAAAAAD//wAAP3zT+AAAIABJREFU/v7+AAEBAQAAAAAA////AP/9/gAAAAAAAAAA
AAAAAAAAAAAA/v3+AP///gD+/v4AAAAAAP///wD+/v4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP7//wD+/v4AAQEBAAAAAAD+
/v4A/v8AAAAAAAAAAAAAAAAAAAgICABiZGQAhYOCAAMDBAAAAAAAAAAAAAEBAQCpp6gAIyQkAAwM
DAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAIBgQAAwEAAP7+/QD7+/0AAAAAAAAAAAAAAAAAAP/+AP7+/AD//gAA
AP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAL7J3QDv8fYA+vz9AGBPMwA2LBwA/f7/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP39
/gA2LBwAAAAAAAAAAABDNyIAtMLYAPj5+gCqudIAe2VBAAAAAAAAAAAABQQCAFdHLQCSpcYABgUD
AH+WvACjhlUAAgIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAD+/v8AAgIBAAAAAAAAAAAAAAAAAP/9/AD//f0A//4AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQA
AAAAAAAAAP/9/gD//v0AAAAAAP8A/wD//v0A/wH/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAP8AACwgEQApIBMA+vv9AAD+/QD//v0AAAAAAAAAAAAAAAAAAAAAAAD+/gAAAAAAAP7/
AP/+/QAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wD+/v4A/wD/AAAAAAD///8A
/f7+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8A/wD+/v4A/f79AAAAAAAA
AAAA/v7+AAD//wAAAAAAAAAAAAAAAADPz88A7/DvAAMDAwAAAAAAAAAAACMjIwBRU1MAAgICAAAA
AAAA//8AAwMDABcYFwAAAAAAAAAAAAAAAAAdHh4AJSYlANzc3AACAgIAAAAAAAECAQC8vLsALC4t
AAEBAQAAAAAAAAAAAP7+/gD9/v0AAAAAAAAAAAACAQIA////AAAAAAAAAAAAAAAAAAAAAAAAAAAA
ODg4ADU1NQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD+/v4A/f79AAAAAAAAAAAA/v7+AP8A/wAA
AAAAAAAAAAAAAAAA//8A/v7+AP7//gAAAAAAAP8AAP7+/gAAAAAAAAAAAAAAAAAAAAAAAAAAAAQF
BABtcG8AEBAQAAAAAAAAAAAAAAAAAAAAAAAAAAAA////AP7+/gAAAQAAAAAAAAD/AAD9/v4AAAAA
AAAAAAAAAAAAAAAAAP8A/wD9/f4AAQL9AAAAAAAA/wAA+vv7APHx8gD6+fkAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQFBAAREREAAAAAAAAAAAD///4A/v7+AAABAAAA
AAAA//7/AP///gAAAAAAAAAAAAAAAAAAAAAAJCUkAFVXVwCmpKUABQYFAAAAAAAAAAAA5OTkAKuq
qgBhYmIAAAAAAAAAAAAAAAAAAAAAAN/l7wCwvNQAcV89AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAA7/L3APf3+QD//P0AGxUMAAAAAAAAAAAAAAAAAAD//wD//f0A
/wIBAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAP39/gC3w9gA/v39ABYQCQBaSS8ADAoGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAALSUYABwVDADd4+0As7/VAGZUNgAVEQsAAAAAAAAAAABaSS4AvMba
ANrg6wDj5+8AkKPEAHJfPQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAACzwNcA09rnAHpmQgAAAAAAAAAAAAAAAAD+/f0A//39AP79AQAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAEAAAAAAAAAAAA//4AAP7+AAAAAAAA//8AAP/+AAD+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAABFNiAAAAAAAAAAAAD//v8AAP7+AAAAAAAAAAAAAAAAAAAAAAD//v8AAAD/
AP8A/wAA/v4A/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AP4A/v79AAAAAAAAAAAA
////AP/+/gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAA/v79AP/+/gAA
AAAAAAAAAP///gD/AAAAAAAAAAAAAAAAAAAAsa+vAAEAAAD//v4AAAAAAAAAAAA4OTkAKysrAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFVXVwCCf38ABgYGAAAAAAAAAAAA29ra
AO3s7AAUFRUAAAAAAAAAAAD+//4A//7+AAAAAAAAAAAA/gH/AAAA/wAAAAAAAAAAAAAAAAAAAAAA
AAAAAAICAgACAgIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/v/+AP/+/gAAAAAAAAAAAP7+/QAA
AAAAAAAAAAAAAAAAAAAA//8AAP7//gD//v4AAAAAAP///wD+//4AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAEBAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8A/wD+/v0AAQEAAAAAAAD///8A/v4C
AAAAAAAAAAAAAAAAAAAAAAD//v8A///9AP/+AgAAAAAAAAAAAOjn5gBtamkAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP7+/gAkJSYAgIKBAAAAAAAAAAAA/v7/AP7+/QAB
AQEAAAAAAP7+/gD///8AAAAAAAAAAAAAAAAAAAAAAAAAAABDREQAy8rKAN/e3gAAAAAAAAAAAAIC
AQC6uLgAKysrADY3NwAAAAAAAAAAAAAAAAB0irMA6OzzAMbQ4ACUfFEAFhMMAAEAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKWzzgD7+/sACAYEACcgFQAAAAAAAAAAAAAAAAD//v8A
//39AP8CAQAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAADt8fYAxc3eAAMDAgA6Lh4ADAoGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABpVzgAa4KuAAYFAwCOoMAAh3FLAAAAAAAAAAAAAAAA
AH1nQgBoga0A9vj7AKq30ADx8/cAgWxGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAChr8wAmKvIAAQDAgABAP8Ad2RCAAICAQAAAAAAAP79AP/9/QAA/QIAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAgAAAAAAAAAA//39AP79/QAAAAAAAP//AP79/QD+/f0A/v39AP79/QD+/f0A/v39AP79
/QD+/f0A/v39AP/+/QAEAf8APzIfAAAAAAAAAAAA//79AP79/QD+/f0A/v39AP79/QD+/f0A//79
AAAAAAAA/v4A/v39AAD+/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//4AAP7+/wD+/v8A
/v7/AP39/wD+/v4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wD/AP7+/wD+
/v8A/v7/AP7+/wD9/v8AAAAAAAAAAAAAAAAAwMDAAO3s7gD//wAA/v7/AP39/wAAAAEAOjo7AAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfHx8AGxscAP7+/wD+/v8A/v7/
AO/v7wDJyMkAAAAAAAAAAAAAAAAA//7/AP39/gD+/v8A/v7/AP7+/wD//wAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AP79/gD+/v8A/v7/AP7+/wD+
/v8AAAAAAAAAAAAAAAAAAAAAAP8A/wD+/f4A/v7/AP7+/wD+/v8A/v3+AAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//4A/v7/AP7+/wD+/v8A/v7/
AP7//wAAAAAAAAAAAAAAAAAAAAAA///+AP39/wD+/v8A/v7/AP7+/wD+/v8AAAABAAAAAQAAAAEA
AAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAD/AAAAAAAAAAAAAAAAAP///wD+
/v8A/v7/AP7+/wD+/v8A////AAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHAF1eXgD7+/wA/v7/AP7+
/wD+/v8ABQUGAJ6cnQDu7u4AAAAAAAAAAADn6/IACwcDAP37+wDm5+8AWHGhAJGgwgDT2ucAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAA3OHrAHaLswDFzd0A/vv8ACsiFgApIhYAAAAAAAAAAAAAAAAA
AAD/AP/+/gD//v0A////AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAj5/AAP79/QD7+fsAVkkvAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANy4eACggFAAA//4Ay9HhAOXp8QAAAAAAAAAA
AAAAAAAhHBIAemVBAAL//gADAf8AucPXAF12pQC4w9cA9PX5AAAAAAAAAAAAAAAAAAAAAAAAAAAA
8/X5ALnD2ABheacAk6TCAAH+/QAGAwEAOzEhAAEBAQAAAAAAAAAAAP7+/gD//v4A//79AAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAQAAAAAAAAAAP///gAA//4AAAAAAAAAAAAA//8AAP/+AAAAAAAAAAAAAAAAAAAA
AAD/AAAA/f3+AAAAAAD8/f4APzokABURCgAAAAAAAAAAAAD//gAA//4AAAAAAAAAAAAAAAAAAAAA
AP7+/gADAwIA+Pr7AAD//gAAAP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wD9/f0A
AAAAAAAAAAD///8A/v//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AAD9
/f0A/f39AAAAAAAAAAAA/v39AAAAAAAAAAAAAAAAAKupqgAFBgUA/f39AAAAAAD8+/wARUhGAAoL
CgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACQkJACssLADm5uYAAAAA
AAAAAAACAgMAqKemAEtNTAAAAAAAAAAAAP7+/gD+/v4AAAAAAAAAAAABAQEAAAD/AAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8AAAD+/v4A/f39AAAAAAAA
AAAA/v39AAD//wAAAAAAAAAAAAAAAAAA//8A/v7+AP7+/gAAAAAAAAAAAP7+/gAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////AP39/QAAAAAAAAAA
AP///wACAgIAAAAAAAAAAAAAAAAAAAAAAP7+/wD+/v4A/f39AAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/v7+AP7+/wAAAAAAAAAAAAAAAAD/
//4A/f39AAEBAQAAAAAA////AP/+/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAiIyMAXV9eAJya
mwAHBwcAAAAAAAAAAADy8vIApqSlAGxubQAAAAAAGRUOAJyFWACHmbsAs77UAAAABACruM4Ar7vQ
AAQDAgAoIhcAIRwTAAoJBQDv8vcAzdTjAOzw9QD9/f4ABAIAABUSCgCPeU8AAgIBAAAAAAAAAAAA
AAAAAP///wD//f0A/wIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAA4ubvAL3G2AABAQEAPTMiACAbEgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABmVzkAdYmwAPb2/gC+x9kAXVA2
AAAAAAAAAAAAAAAAAD82JACiiloAaH6qAPL0+ADe4usAhZa6AAUFAwAgGxEAKSMYAAsJBgDx9PgA
1tzoAOXp8QD7/P0A/v7/AAUEAQAYFA0AnYVYABEPCgAAAAAAAAAAAAAAAAAA/fwA//3+APf3/QBE
XpQA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AD82
JQB8akcAAgIBAAAAAAAEAAAAAAAAAAD//f4A//3+AAAAAAD///8A//39AP8AAgAAAAAAAAAAAAAA
AAAAAAAAHhgPAHVfPAAIBwQA/v7/AB4YDwAAAAAAAAAAAAAAAAD//f4A//7+AAAAAAAAAAAAAAAA
AAAAAADj5+8AaoWyANff7AACAf8AAP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD9/v0A
+/v6AAD/AAAAAAAA/v//APv6+gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD+
//0A+vr6AAQDAwAAAAAAAAAAAPsGBgD///8AAAAAAM7NzQDu7ewA/fz9AAAAAAD/AAAA//7+AFhZ
WQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFRkYAtLOy
AAEBAgABAAAAAAAAAPr7+gCysLEATlBPAAAAAAD7+/sA+vr6AAEAAAAAAAAAAQIBAP7+/gAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAA+/v7APv6+gAA
AAAAAAAAAP3+/QD//wAAAAAAAAAAAAAAAAAA/v7/APr6+gD//v4AAAAAAP8A/wACAwIAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP39/gD7+voA/gMD
AAAAAAD/AP8AAP//AAAAAAAAAAAAAAAAAAAAAAD9/fwA+vr5AP/+/gAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP7//gD7+/sAAAAAAAAAAAAA
AAAA/Pz8APv7+gABAAEAAAAAAP7//gD9/fwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEhJ
SQDKyckA09LTAAEAAAAAAAAAAAAAALi2tgAqKysAQkNCAAAAAAAGBQMAf2xIAFBDLQCir8kA0tjl
AO7x9gAEAwIAy9HfAMnQ3wAAAP8AAQABAAICAQD9/v4ADQsIAD45JQB5aEYAAwMCAAAAAAAAAAAA
AAAAAAAAAAD9/f4A+vn7AAH//wD//v4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAJmnxAD+/P0A/v//AHNjQwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALicaABgTDADm6fAAprLL
AFlMNAAEBAIAAAAAAAAAAAAAAAAAHxoSAKqRYQCTosEAxs3dAOjs8wD6+QEA1dr4ANPY5gAA//8A
AAEBAAIBAQAAAP8A/v//AB0YEQBDOicAZ1o8AAQDAgAAAAAAAAAAAAAAAAAAAAAA+vn8APr8/QAB
AAAA+vn7AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAD3+PoAAAAAAAAAAAAAAAAABAAAAAAAAAAAAP/+AP/+/gAAAAAAAP/+AP/+/gD/AP8AAAAAAAAA
AAAAAAAAAAAAAAcFAgAlHhMACAcEAAAAAAAAAAAAAAAAAAAAAAD/AAAA//7+AP/9/QAAAAAAAAAA
AAAAAAAAAAAAAAAAANjf6wACAAAA/vz9APz9/gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
JSUmAFBSUgAAAP8AAAAAAP//AAALCwwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAFBQVAFVXVgAFBQQAAAAAAAAAAAAGBgcACQkJAAAAAAAAAAAATE5OAAEBAAAAAAAA//8AABcX
FwAMDAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGxwb
AF5gYQDz8/EAAQEBAAAAAAAA/wAAAwMDAAAAAAABAQEAQkRDAPDv7wAAAQAAAAAAAAAAAQAXFxcA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAkIAElKSQD3
+PcAAAAAAAAAAAD+/v8ACwwLAAAAAAAAAAAAAAAAABgYGABQUVAA/wD/AAAAAAAA/wAABAUFAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAkJCQAUVRT
AAICAQAAAAAA//8AAAMCAwAAAAAAAAAAAAAAAAAAAAAAMjMzAAsMDAADAwIAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///8AFBQVAAAAAAAA
AAAAAQEBADU2NgAWFxcAAQEAAAAAAAD//wAAKisrAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAZGZmAMLAwAD+//4AAAAAAAAAAAAA/wAA7ezrAPn4+AAHCAgAAAAAAAAAAAAvKRsAiiZQ
AO/y9gDV2ucAwMnbANnd6ADp7fMA9/j6AA0MCAAlHxYAQDgmAD42JAAUEQwAAgIBAAAAAAAAAAAA
AAAAAAAAAAAAAAAAKCIWAGJUNwAEAwIAFhMNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAPf4+wAoIhYAGhYOABkVDgAZFg4AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAOCQBrWz4A2+Hq
APv8/QDl6fAAHxsSAAAAAAAAAAAAAAAAAAAAAAANCwcAemlGAPHz+ADR1+QAusPWAM/W5ADl6O8A
/f3/AAkIBQAdGREAMiweAEc+KgAmIBYADQwIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAF5RNgD9
/v4AAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAD/AAAAJSAVAAEBAAAAAAAAAAAAAAH/////AAAAAE1soQDw8/gAvZxkAMLN3wCAlbwAAwMCAAAA
AAAAAAAAAAAAAAAAAAAlHxMAk3lOAAkIBQAAAAAAAAAAAAAAAAAAAAAA+fv9AFt2qADr7/UAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAA/v7/ACIcEgCcgVIABQUDAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAACuH1Q8AAAgAElEQVQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABOSrG1QQAAAAAAAAAAAD+/gD/
/f0AAAD/AP///wD+/v4AAQH/AAAAAAAAAAAAAAAAAAAAAAD//v8AAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAf//AP7+/gD+/v0AAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAAHBYOAJF4TAAFBQMAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAD/
/v4AAP/+AAAAAAAA//8AAP79AAABAgAAAAAAAAAAAAAAAAAAAAAAAP/9AAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAABAAAA//0AAP7+AAAAAAAAAAAAAAAAAAAAAAD+//8AEw8KAJ+GVgAJBwUAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAA
AAAA///+AP/+/gD//wAAAAD/AP/+/gD/AQAAAAAAAAAAAAAAAAAAAAAAAP/+/wAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAA//7/AP/+/gAAAAAAAAAAAAAAAAAAAAAAHBYOAJV/VAAJBwUAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQA
AAAAAAAAAP/+/gD//v4AAAAAAAD/AAD//v4A/wEAAAAAAAAAAAAAAAAAAAAAAAD///8AAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAP8AAP/+/gD//v4AAAAAAAAAAAD//wAABwYEAJN9UwAUEQsAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAACAAAAAAAAAAAA//4A///9AAAAAAD///8A///+AAD//gAA//4AAP/+AAD//gAA//4AAP7+AAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8AAAAA//4AAP/+AAD//gD//v0AFxIKAKWMXAAWEwwAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAABAAAAAAAAAAA//3+AAD9/gAAAAAAAAD/AAD9/QD/AP8AAAAAAAAAAAAAAAAAAAAAAP/+
/gAAAP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA//7+AP/9/QAAAAAABQUDAI16UQAaFw8AAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAQAAAAAAAAAAC0nGgD09fkAAgIBABIOCgAxKx0AAwIBAAAAAAAAAAAAAAAAAAAA
AAAdGhEAAgICAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgEBACwlGQDwFw8A+/z9AHNkRAAiHRQAAAAA
AAAAAAAAAAAAANFm+AUAAA2lSURBVAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB/////wAAAAD8/P0A/wAAAAUEAwD+//8A/f3+AAAA
AAAAAAAAAAAAAAAAAAAAAAAAAQEBAAQDAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD8/P4A/wD/
AAEAAQAEBAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFuHrTO9YcAAAAAAElFTkSuQmCCAAA=

--_004_1B2E1442EB0A43E396BB15C717E966E5hammerspacecom_--

--===============2498226016456158712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

--===============2498226016456158712==--

